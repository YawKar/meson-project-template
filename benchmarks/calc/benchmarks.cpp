#include <benchmark/benchmark.h>

#include <calc/calc.hpp>

static void bm_celsius_to_fahrenheit(benchmark::State& state) {
    for (const auto& _ : state) {
        benchmark::DoNotOptimize(celsius_to_fahrenheit(12));
    }
}

BENCHMARK(bm_celsius_to_fahrenheit);
