googlebenchmark_project = subproject(
    'google-benchmark',
    default_options: {'tests': 'disabled'},
)
benchmark_main_dep = googlebenchmark_project.get_variable(
    'google_benchmark_main_dep',
)

subdir('calc')
subdir('greeter')
