googlebenchmark_project = subproject(
    'google-benchmark',
    default_options: {'tests': 'disabled'},
)
benchmark_dep = googlebenchmark_project.get_variable('google_benchmark_dep')
benchmark_main_dep = googlebenchmark_project.get_variable(
    'google_benchmark_main_dep',
)

subdir('calc')
subdir('greeter')

benchmarks_runner_exec = executable(
    'benchmarks_runner',
    'benchmarks_runner.cpp',
    link_whole: [calc_benchmarks_lib, greeter_benchmarks_lib],
    dependencies: [benchmark_main_dep],
)

benchmark(
    'benchmarks',
    benchmarks_runner_exec,
    args: [
        '--benchmark_counters_tabular=true',
        '--benchmark_color=true',
        '--benchmark_out=./benchmarks_report.json',
    ],
)
