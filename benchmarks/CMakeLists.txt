find_package(benchmark REQUIRED)

add_executable(benchmarks sample_benchmark.cpp)

target_link_libraries(benchmarks benchmark::benchmark pthread)
