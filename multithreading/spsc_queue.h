#include <atomic>
#include <optional>

constexpr bool is_power_of_2(const int n)
{
    if (n <= 0)
        return false;
    /**
     * If n is a power of 2, only the left-most bit will be set
     */
    return (n & (n - 1)) == 0;
}

template <typename T, int size> class SPSC_Queue
{
    static_assert(is_power_of_2(size), "SPSC_Queue can only be declared with 2^n size.");

  public:
    SPSC_Queue() = default;

    bool push(const T& item)
    {
        if (head_.load(std::memory_order_relaxed) != tail_.load(std::memory_order_relaxed) + 1)
        {
            ring_buffer_[head_.fetch_add(1, std::memory_order_release)] = item;
            return true;
        }
        // drop
        return false;
    }

    T pop()
    {
        if (head_.load(std::memory_order_relaxed) != tail_.load(std::memory_order_relaxed))
        {
            return ring_buffer_[tail_.fetch_add(1, std::memory_order_release)];
        }
        return std::nullptr_t;
    }

    T &top() const
    {
        if (head_.load(std::memory_order_relaxed) != tail_.load(std::memory_order_relaxed))
        {
            return ring_buffer_[tail_.load(std::memory_order_acquire)];
        }
        return std::nullptr_t;
    }

  private:
    T                ring_buffer_[size];
    std::atomic<int> head_  = 0;
    std::atomic<int> tail_  = 0;
    std::atomic<int> length = 0;
};