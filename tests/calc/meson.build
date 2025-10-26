calc_test_exec = executable(
  'calc_test',
  'test.cpp',
  link_with: [
    calc_lib,
  ],
  include_directories: [
    libs_include,
  ],
  dependencies: gtest_main_dep,
)

test('calc test', calc_test_exec)
