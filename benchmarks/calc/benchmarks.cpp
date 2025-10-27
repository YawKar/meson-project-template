#include <benchmark/benchmark.h>
#include <calc/calc.hpp>

static void BM_celsius_to_fahrenheit(benchmark::State& state) {
  for (auto _: state) {
    benchmark::DoNotOptimize(celsius_to_fahrenheit(12));
  }
}

BENCHMARK(BM_celsius_to_fahrenheit);
