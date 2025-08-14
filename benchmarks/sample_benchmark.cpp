#include <benchmark/benchmark.h>

struct S10 {
    int doWork() { return 10; }
};

struct S9 {
    S10 member;
    int doWork() { return member.doWork(); }
};

struct S8 {
    S9 member;
    int doWork() { return member.doWork(); }
};

struct S7 {
    S8 member;
    int doWork() { return member.doWork(); }
};

struct S6 {
    S7 member;
    int doWork() { return member.doWork(); }
};

struct S5 {
    S6 member;
    int doWork() { return member.doWork(); }
};

struct S4 {
    S5 member;
    int doWork() { return member.doWork(); }
};

struct S3 {
    S4 member;
    int doWork() { return member.doWork(); }
};

struct S2 {
    S3 member;
    int doWork() { return member.doWork(); }
};

struct S1 {
    S2 member;
    int doWork() { return member.doWork(); }
};

static void BM_NestedCallChain(benchmark::State& state) {
    for (auto _ : state) {
        S1 top_level_object;
        int result = top_level_object.doWork();
        benchmark::DoNotOptimize(result);
    }
}
BENCHMARK(BM_NestedCallChain);

static void caller()
{
    int a = 10;
}
static void BM_Normal(benchmark::State &state)
{
    for (auto _ : state)
    {
        caller();
        int a = 10;
    }
}
BENCHMARK(BM_Normal);



BENCHMARK_MAIN();