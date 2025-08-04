/**
 * The idea is to profile how much time it takes for an std::atomic<int>
 * and an int to increment for N number of times in multiple threads
 * pinned in different cores.
 * 
 * This also validates the importance of atomic
 * operations in a multithreaded environment for predictable outcome.
 * 
 * Note: All durations are in microseconds.
 */
#include <chrono>
#include <functional>
#include <iostream>
#include <map>
#include <memory>
#include <sched.h>
#include <signal.h>
#include <string>
#include <thread>

int               g_counter_non_atomic = 0;
char              pad[64];
std::atomic<int>  g_counter_atomic = 0;
std::atomic<bool> g_is_running{true};

void signal_handler(int);
void execute();
void increment_counter_atomic(const int &);
void increment_counter_non_atomic(const int &);
bool pin_thread(std::unique_ptr<std::thread> &, int);
void run_profiling(std::function<void(int)>, int, const char *);


int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        std::cerr << "Required arguments weren't provided!\n";
        return -1;
    }

    int incremenet_times;
    try
    {
        incremenet_times = std::stoi(argv[1]);
    }
    catch (std::exception &ex)
    {
        std::cerr << "The given argument: " << argv[1] << " is invalid.\n";
        return -1;
    }

    signal(SIGINT, signal_handler);
    signal(SIGTERM, signal_handler);

    run_profiling(increment_counter_atomic, incremenet_times, "Atomic");
    run_profiling(increment_counter_non_atomic, incremenet_times, "Non-atomic");

    return 0;
}

template <typename duration_unit> class ScopedStopwatch
{
  public:
    ScopedStopwatch(const std::string &name) : name_{std::move(name)}, start_tp_{std::chrono::high_resolution_clock::now()}
    {
    }

    ~ScopedStopwatch()
    {
        std::cout << "Total time taken in " << this->name_
                  << " is: " << std::chrono::duration_cast<duration_unit>(std::chrono::high_resolution_clock::now() - start_tp_) << "\n";
    }

  private:
    std::string                                    name_;
    std::chrono::high_resolution_clock::time_point start_tp_;
};


void run_profiling(std::function<void(int)> func, int incremenet_times, const char *type)
{
    ScopedStopwatch<std::chrono::microseconds> stp(type);

    std::unique_ptr<std::thread> t1 = std::make_unique<std::thread>(func, incremenet_times);
    std::unique_ptr<std::thread> t2 = std::make_unique<std::thread>(func, incremenet_times);

    pin_thread(t1, 1);
    pin_thread(t2, 3);

    if (t1->joinable())
    {
        t1->join();
    }
    if (t2->joinable())
    {
        t2->join();
    }

    std::cout << "Final " << type << " value: ";
    if (type == "Atomic")
    {

        std::cout << g_counter_atomic << std::endl;
    }
    else
    {
        std::cout << g_counter_non_atomic << std::endl;
    }
}

void increment_counter_atomic(const int &times)
{
    std::this_thread::sleep_for(std::chrono::milliseconds(10));
    for (int time = 0; time < times; time++)
    {
        g_counter_atomic++;
    }
}

void increment_counter_non_atomic(const int &times)
{
    std::this_thread::sleep_for(std::chrono::milliseconds(10));
    for (int time = 0; time < times; time++)
    {
        g_counter_non_atomic++;
    }
}

bool pin_thread(std::unique_ptr<std::thread> &th, int cpu)
{
    cpu_set_t cpuset;
    CPU_ZERO(&cpuset);
    CPU_SET(cpu, &cpuset);
    if (pthread_setaffinity_np(th->native_handle(), sizeof(cpuset), &cpuset))
    {
        std::cerr << "Failed to set thread affinity\n";
        return false;
    }
    return true;
}

void execute()
{
    while (g_is_running.load(std::memory_order_acquire))
    {
        std::cout << "Executed thread: " << std::this_thread::get_id() << " CPU: " << sched_getcpu() << "\n";
        std::this_thread::sleep_for(std::chrono::seconds(3));
    }
    std::cout << "Exiting while true loop for thread: " << std::this_thread::get_id() << "\n";
}

void signal_handler(int signal)
{
    constexpr const char *action_msg = "Program termination requested, shutting down...\n";
    std::cout << action_msg;
    g_is_running.store(false, std::memory_order_release);
}

/**
 * INPUT -> 1000000000 (1 Billion)
 * 
 * ----- OUTPUT ------
 * Final Atomic value: 2000000000
 * Total time taken in Atomic is: 43237072us
 * Final Non-atomic value: -954752839
 * Total time taken in Non-atomic is: 47879298us
 * ------ END ------
 */