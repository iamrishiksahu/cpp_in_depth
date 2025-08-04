/*
 * High‑level skeleton for low‑latency market‑data‑driven strategy execution.
 * C++23, header‑only except for main().
 *
 *  Components
 *  ----------
 *  1. SpscRingBuffer<T, Capacity>  – lock‑free bounded queue (single producer / single consumer)
 *  2. InstrumentStrategyRegistry   – thread‑safe map<InstrumentId, vector<StrategyId>>
 *  3. MarketDataStore              – thread‑safe map<InstrumentId, MarketData>
 *  4. Strategy interface           – Strategy::on_market_data(const MarketData&)
 *  5. StrategyWorker               – owns Strategy* and consumes a ring buffer of tasks
 *  6. ThreadPoolOfStrategies       – N StrategyWorkers, next_worker = (idx++) % N
 *  7. Dispatcher                   – pops MarketDataActions from ingestion_queue,
 *                                    looks up interested strategies,
 *                                    pushes actions to workers in round‑robin
 *  8. MarketDataIngestion          – pushes MarketDataActions to ingestion_queue
 *  9. main()                       – wire everything, mock feed, graceful shutdown
 *
 *  Notes
 *  -----
 *  * All inter‑thread hand‑off paths are SPSC to stay lock‑free and avoid
 *    cache‑line contention.
 *  * resize() / dynamic allocation is avoided inside the hot path.
 *  * Registry and store are read‑mostly so guarded by shared mutexes.
 *
 *  Replace placeholders (TODO) with your production implementations
 *  (e.g. subscription logic, FIX connectivity, real strategies, etc.).
 */

#include <atomic>
#include <array>
#include <cassert>
#include <chrono>
#include <cstddef>
#include <functional>
#include <iostream>
#include <mutex>
#include <shared_mutex>
#include <string>
#include <thread>
#include <unordered_map>
#include <vector>

// ---------- 1. Lock‑free single‑producer / single‑consumer ring buffer -----

template <typename T, std::size_t CapacityPow2>
class SpscRingBuffer
{
    static_assert((CapacityPow2 & (CapacityPow2 - 1)) == 0,
                  "Capacity must be power of two");
  public:
    bool push(const T& v) noexcept
    {
        const std::size_t head = head_.load(std::memory_order_relaxed);
        const std::size_t next_head = (head + 1) & mask_;
        if (next_head == tail_.load(std::memory_order_acquire))
            return false;                 // queue full
        buffer_[head] = v;
        head_.store(next_head, std::memory_order_release);
        return true;
    }

    bool pop(T& out) noexcept
    {
        const std::size_t tail = tail_.load(std::memory_order_relaxed);
        if (tail == head_.load(std::memory_order_acquire))
            return false;                 // queue empty
        out = buffer_[tail];
        tail_.store((tail + 1) & mask_, std::memory_order_release);
        return true;
    }

  private:
    static constexpr std::size_t mask_ = CapacityPow2 - 1;
    std::array<T, CapacityPow2> buffer_{};
    std::atomic<std::size_t> head_{0};
    std::atomic<std::size_t> tail_{0};
};

// ---------- 2. Basic domain types ------------------------------------------

using InstrumentId = std::string;
using StrategyId   = std::string;

struct MarketData
{
    double price{};
    double size{};
    std::chrono::steady_clock::time_point ts{};
};

struct MarketDataAction
{
    InstrumentId instrument;
    MarketData   data;
};

// ---------- 3. Instrument / Strategy registry ------------------------------

class InstrumentStrategyRegistry
{
  public:
    void add(const InstrumentId& inst, const StrategyId& sid)
    {
        std::unique_lock lock(mtx_);
        map_[inst].push_back(sid);
    }

    std::vector<StrategyId> lookup(const InstrumentId& inst) const
    {
        std::shared_lock lock(mtx_);
        auto it = map_.find(inst);
        return it == map_.end() ? std::vector<StrategyId>{} : it->second;
    }

  private:
    mutable std::shared_mutex mtx_;
    std::unordered_map<InstrumentId, std::vector<StrategyId>> map_;
};

// ---------- 4. Market data store -------------------------------------------

class MarketDataStore
{
  public:
    void update(const InstrumentId& inst, const MarketData& md)
    {
        std::unique_lock lock(mtx_);
        map_[inst] = md;
    }

    std::optional<MarketData> latest(const InstrumentId& inst) const
    {
        std::shared_lock lock(mtx_);
        auto it = map_.find(inst);
        return it == map_.end() ? std::nullopt : std::optional<MarketData>(it->second);
    }

  private:
    mutable std::shared_mutex mtx_;
    std::unordered_map<InstrumentId, MarketData> map_;
};

// ---------- 5. Strategy interface -----------------------------------------

class Strategy
{
  public:
    explicit Strategy(StrategyId id): id_(std::move(id)) {}
    virtual ~Strategy() = default;
    const StrategyId& id() const noexcept { return id_; }
    virtual void on_market_data(const MarketData&) = 0;

  private:
    StrategyId id_;
};

// Example dummy strategy
class PrintStrategy final : public Strategy
{
  public:
    using Strategy::Strategy;
    void on_market_data(const MarketData& md) override
    {
        std::cout << "[Strat " << id() << "] price=" << md.price << '\n';
    }
};

// ---------- 6. Strategy worker & pool --------------------------------------

class StrategyWorker
{
    using Queue = SpscRingBuffer<MarketDataAction, 1 << 12>; // 4096

  public:
    StrategyWorker(): th_([this] { run(); }) {}

    ~StrategyWorker()
    {
        running_.store(false, std::memory_order_relaxed);
        if (th_.joinable()) th_.join();
    }

    bool enqueue(const MarketDataAction& a) { return q_.push(a); }

    void attach_strategy(std::shared_ptr<Strategy> s)
    {
        strategy_ = std::move(s);
    }

  private:
    void run()
    {
        MarketDataAction a;
        while (running_.load(std::memory_order_relaxed))
        {
            while (q_.pop(a))
                if (strategy_) strategy_->on_market_data(a.data);

            std::this_thread::yield();
        }
    }

    std::atomic<bool> running_{true};
    Queue             q_;
    std::shared_ptr<Strategy> strategy_;
    std::thread       th_;
};

class ThreadPoolOfStrategies
{
  public:
    explicit ThreadPoolOfStrategies(std::size_t n)
        : workers_(n)
    {
        for (std::size_t i = 0; i < n; ++i)
        {
            // For demo each worker has its own strategy instance
            workers_[i].attach_strategy(
                std::make_shared<PrintStrategy>("S" + std::to_string(i)));
        }
    }

    bool dispatch(const MarketDataAction& a)
    {
        // round‑robin
        const std::size_t idx = next_.fetch_add(1, std::memory_order_relaxed) % workers_.size();
        return workers_[idx].enqueue(a);
    }

  private:
    std::vector<StrategyWorker> workers_;
    std::atomic<std::size_t>    next_{0};
};

// ---------- 7. Dispatcher ---------------------------------------------------

class Dispatcher
{
    using Queue = SpscRingBuffer<MarketDataAction, 1 << 16>; // 65536

  public:
    Dispatcher(InstrumentStrategyRegistry& reg,
               MarketDataStore&           store,
               ThreadPoolOfStrategies&    pool)
        : registry_(reg), store_(store), pool_(pool), th_([this]{ run(); })
    {}

    ~Dispatcher()
    {
        running_.store(false, std::memory_order_relaxed);
        if (th_.joinable()) th_.join();
    }

    bool accept(const MarketDataAction& a) { return q_.push(a); }

  private:
    void run()
    {
        MarketDataAction a;
        while (running_.load(std::memory_order_relaxed))
        {
            while (q_.pop(a))
            {
                store_.update(a.instrument, a.data);

                for (const auto& sid : registry_.lookup(a.instrument))
                {
                    // (Optional) Embed strategy id inside action if needed
                    pool_.dispatch(a);
                }
            }
            std::this_thread::yield();
        }
    }

    InstrumentStrategyRegistry& registry_;
    MarketDataStore&            store_;
    ThreadPoolOfStrategies&     pool_;
    Queue                       q_;
    std::atomic<bool>           running_{true};
    std::thread                 th_;
};

// ---------- 8. Market data ingestion ---------------------------------------

class MarketDataIngestion
{
    using Queue = SpscRingBuffer<MarketDataAction, 1 << 16>; // 65536
  public:
    explicit MarketDataIngestion(Dispatcher& d): dispatcher_(d), th_([this]{ run(); }) {}
    ~MarketDataIngestion()
    {
        running_.store(false, std::memory_order_relaxed);
        if (th_.joinable()) th_.join();
    }

    // Called from main thread to subscribe/unsubscribe; mock impl
    void subscribe(const InstrumentId& inst)
    {
        subs_.push_back(inst);
    }

  private:
    void run()
    {
        // Mock: publish random prices every 1 ms
        while (running_.load(std::memory_order_relaxed))
        {
            for (const auto& inst : subs_)
            {
                MarketData md{random_price(), 1.0,
                              std::chrono::steady_clock::now()};
                dispatcher_.accept({inst, md});
            }
            std::this_thread::sleep_for(std::chrono::milliseconds(1));
        }
    }

    static double random_price()
    {
        static thread_local uint32_t s = 1234567u;
        s = s * 1664525u + 1013904223u;
        return 100.0 + (s % 1000) / 10.0; // 100 – 200
    }

    Dispatcher&                dispatcher_;
    std::vector<InstrumentId>  subs_;
    std::atomic<bool>          running_{true};
    std::thread                th_;
};

// ---------- 9. main() -------------------------------------------------------

int main()
{
    InstrumentStrategyRegistry registry;
    registry.add("IBM", "S0");
    registry.add("IBM", "S1");
    registry.add("MSFT", "S2");

    MarketDataStore store;
    ThreadPoolOfStrategies pool(/*n=*/3);
    Dispatcher dispatcher(registry, store, pool);
    MarketDataIngestion ingestion(dispatcher);

    ingestion.subscribe("IBM");
    ingestion.subscribe("MSFT");

    std::this_thread::sleep_for(std::chrono::seconds(2));
    std::cout << "Shutting down...\n";
    return 0; // destructors join threads
}
