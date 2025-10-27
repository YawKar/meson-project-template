calc_benchmarks_exec = executable(
  'calc_benchmarks',
  'benchmarks.cpp',
  link_with: [
    calc_lib,
  ],
  include_directories: [
    libs_include,
  ],
  dependencies: benchmark_main_dep,
)

benchmark('calc benchmarks', calc_benchmarks_exec)
