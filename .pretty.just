[default]
_default: (_meta::list_recipes source_file())

# run autoformat on: justfile, meson.build files, flake.nix files, cpp/hpp files
[group("Pretty")]
fmt:
    find . -name "*.just" -or -name "justfile" | xargs -I % just --fmt --unstable --justfile %
    nixfmt -sv flake.nix
    meson format -ri
    find bins libs tests benchmarks -type f -name "*.cpp" -o -name "*.hpp" | xargs clang-format -i --Werror

# run linters: run-clang-tidy
[group("Pretty")]
lint:
    run-clang-tidy -quiet -p $(just _common_variables::build_root)/DEFAULT bins libs tests benchmarks

[group: "Modules"]
mod _meta ".meta.just"
[group: "Modules"]
mod _common_variables ".common_variables.just"
