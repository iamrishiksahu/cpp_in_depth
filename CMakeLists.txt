cmake_minimum_required(VERSION 3.20)

project(Rishik)

set(CMAKE_CXX_STANDARD 23)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

add_executable(Rishik main.cpp)

# set(CMAKE_CXX_STANDARD_REQUIRED ON)
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++20")

add_subdirectory(assembly_tests)
add_subdirectory(tests)
add_subdirectory(multithreading/trading_strategy_engine)
add_subdirectory(benchmarks)