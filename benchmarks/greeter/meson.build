greeter_benchmarks_exec = executable(
    'greeter_benchmarks',
    'benchmarks.cpp',
    link_with: [greeter_lib],
    include_directories: [libs_include],
    dependencies: benchmark_main_dep,
)

benchmark('greeter benchmarks', greeter_benchmarks_exec)
