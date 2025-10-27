#include <benchmark/benchmark.h>
#include <greeter/greeter.hpp>

static void BM_greeter(benchmark::State& state) {
  for (auto _: state) {
    benchmark::DoNotOptimize(greet("Michael"));
  }
}

BENCHMARK(BM_greeter);
