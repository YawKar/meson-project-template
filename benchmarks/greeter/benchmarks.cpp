#include <benchmark/benchmark.h>

#include <greeter/greeter.hpp>

static void bm_greeter(benchmark::State& state) {
    for (const auto& _ : state) {
        benchmark::DoNotOptimize(greet("Michael"));
    }
}

BENCHMARK(bm_greeter);
