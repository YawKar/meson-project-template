greeter_test_exec = executable(
  'greeter_test',
  'test.cpp',
  link_with: [
    greeter_lib,
  ],
  include_directories: [
    libs_include,
  ],
  dependencies: gtest_main_dep,
)

test('greeter test', greeter_test_exec)
