gtest_project = subproject('gtest', required: true)
gtest_main_dep = gtest_project.get_variable('gtest_main_dep')
gtest_dep = gtest_project.get_variable('gtest_dep')

subdir('calc')
subdir('greeter')

tests_exe = executable(
    'tests_exe',
    'tests_runner.cpp',
    link_whole: [calc_tests_lib, greeter_tests_lib],
    dependencies: [gtest_main_dep],
)

test('tests', tests_exe, args: ['--gtest_output=json:./gtest_report.json'])
