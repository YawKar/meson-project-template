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

benchmarks_exe = executable(
    'benchmarks_exe',
    'benchmarks_runner.cpp',
    link_whole: [calc_benchmarks_lib, greeter_benchmarks_lib],
    dependencies: [benchmark_main_dep],
)

benchmark(
    'benchmarks',
    benchmarks_exe,
    args: [
        '--benchmark_counters_tabular=true',
        '--benchmark_color=true',
        '--benchmark_out=./benchmarks_report.json',
    ],
)
