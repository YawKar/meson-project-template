project(
    'project_template',
    'cpp',
    version: '0.1',
    meson_version: '>= 1.3.0',
    default_options: {
        'warning_level': '3',
        'cpp_std': 'c++17',
        'c_std': 'c17',
        'default_library': 'static',
        'werror': 'true',
        'b_ndebug': 'if-release',
    },
)

warning_flags = [
    '-Wall',
    '-Wextra',
    '-Wpedantic',
    '-Wconversion',
    '-Wsign-conversion',
    '-Wshadow',
    '-Wreturn-stack-address',
    '-Wnon-virtual-dtor',
    '-Wold-style-cast',
    '-Wcast-align',
    '-Wunused',
    '-Woverloaded-virtual',
    '-Wmisleading-indentation',
    '-Wnull-dereference',
    '-Wdouble-promotion',
    '-Wformat=2',
    '-Wimplicit-fallthrough',
]

if meson.get_compiler('cpp').get_id() == 'clang'
    warning_flags += [
        '-Wdangling',
        '-Wmost',
        '-Wthread-safety',
        '-Wno-c++98-compat',
        '-Wno-c++98-compat-pedantic',
    ]
endif

add_project_arguments(warning_flags, language: 'cpp')

subdir('libs')
subdir('bins')
subdir('tests')
subdir('benchmarks')
