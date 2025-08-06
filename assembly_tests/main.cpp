#include <chrono>
#include <csignal>
#include <ctime>
#include <iomanip>
#include <iostream>
#include <thread>

#include <atomic>
#include <chrono>
#include <iomanip>
#include <iostream>
#include <thread>

using namespace std::chrono;

std::atomic<bool> running_ = true;

void PrintCurrentTime()
{
    auto    now        = system_clock::now();
    auto    time_t_now = system_clock::to_time_t(now);
    auto    micros     = duration_cast<microseconds>(now.time_since_epoch()) % seconds(1);
    std::tm utc_tm     = *std::gmtime(&time_t_now);

    std::cout << std::put_time(&utc_tm, "%Y-%m-%d %H:%M:%S") << "." << std::setw(6) << std::setfill('0') << micros.count() << " UTC\n";
}

void task()
{
    std::cout << "start\n";
    for (size_t i = 0; i < 1000; i++)
    {
        /* code */
    }
}
void LoopEverySecondAlignedToWallClock()
{
    using namespace std::chrono;

    // Step 1: Capture time from both clocks
    system_clock::time_point sys_now    = system_clock::now();
    steady_clock::time_point steady_now = steady_clock::now();

    time_point<high_resolution_clock, high_resolution_clock::duration> start = high_resolution_clock::now();

    time_point<high_resolution_clock, high_resolution_clock::duration> end = high_resolution_clock::now();

    duration d = (end - start);

    d.count();

    // Step 2: Calculate duration offset between clocks
    auto offset = duration_cast<system_clock::duration>(sys_now.time_since_epoch()) -
                  duration_cast<system_clock::duration>(steady_now.time_since_epoch());

    // Step 3: Round up to next whole second on system_clock
    system_clock::time_point next_wall_time = time_point_cast<seconds>(sys_now) + seconds(1);

    while (running_)
    {
        // Step 4: Convert wall time to steady time using offset
        steady_clock::time_point aligned_steady_time = steady_clock::time_point(next_wall_time.time_since_epoch() - offset);

        // Step 5: Busy-wait until exact tick
        while (steady_clock::now() < aligned_steady_time)
        {
            // spin
        }

        // std::thread t(task);

        // t.join();

        PrintCurrentTime();
        // Step 6: Do the aligned task

        // Step 7: Move to next whole second
        next_wall_time += seconds(5);
    }
}

void stop(int a)
{
    std::cout << "Signal caught: " << a << "\n";
    running_ = false;
}

int main()
{
    // Register signal handler for Ctrl+C
    std::signal(SIGINT, stop);

    // Start precise 1-second loop
    LoopEverySecondAlignedToWallClock();

    std::cout << "Exited loop.\n";
    return 0;
}
