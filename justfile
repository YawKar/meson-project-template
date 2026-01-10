build := "build"
debug_dir := build / "debug"
asan_dir := build / "asan"
tsan_dir := build / "tsan"
release_dir := build / "release"
runner := if env("CI", "local") == "local" { "local" } else { "ci" }

[default]
[private]
default:
    @just --list --unsorted

# run autoformat on: justfile, meson.build files, flake.nix files, cpp/hpp files
[group("Pretty")]
fmt:
    just {{ if runner == "ci" { "--check" } else { "" } }} --fmt --unstable
    nixfmt -sv{{ if runner == "ci" { "c" } else { "" } }} flake.nix
    meson format -r {{ if runner == "ci" { "--check-only" } else { "-i" } }}
    find bins libs tests benchmarks -type f -name "*.cpp" -o -name "*.hpp" | xargs clang-format --Werror {{ if runner == "ci" { "--dry-run" } else { "-i" } }}

# run linters: run-clang-tidy
[group("Pretty")]
lint: build_debug
    run-clang-tidy -quiet -p {{ debug_dir }} bins libs tests benchmarks

[group("Debug build")]
build_debug:
    meson setup {{ debug_dir }} -Dbuildtype=debug
    meson compile -C {{ debug_dir }}

[group("Debug build")]
clean_debug:
    rm -rf {{ debug_dir }}

[group("UBSan+ASan build")]
build_asan:
    meson setup {{ asan_dir }} -Dbuildtype=debug -Db_sanitize=address,undefined -Db_lundef=false
    meson compile -C {{ asan_dir }}

[group("UBSan+ASan build")]
test_asan: build_asan
    meson test -C {{ asan_dir }}

[group("UBSan+ASan build")]
clean_asan:
    rm -rf {{ asan_dir }}

[group("UBSan+TSan build")]
build_tsan:
    meson setup {{ tsan_dir }} -Dbuildtype=debug -Db_sanitize=thread,undefined -Db_lundef=false
    meson compile -C {{ tsan_dir }}

[group("UBSan+TSan build")]
test_tsan: build_tsan
    meson test -C {{ tsan_dir }}

[group("UBSan+TSan build")]
clean_tsan:
    rm -rf {{ tsan_dir }}

[group("Release build")]
build_release:
    meson setup {{ release_dir }} -Dbuildtype=release
    meson compile -C {{ release_dir }}

[group("Release build")]
benchmark_release: build_release
    meson test --benchmark -C {{ release_dir }}

[group("Release build")]
clean_release:
    rm -rf {{ release_dir }}

[group("CI")]
[private]
ci:
    @[[ "{{ runner }}" != "ci" ]] && echo "Error: CI env var was not set but ci check was called!" >&2 && exit 1 || exit 0

[group("CI")]
ci_check_fmt: ci fmt

[group("CI")]
ci_check_lint: ci lint

[group("CI")]
ci_check_tests: ci ci_build ci_tests

[group("CI")]
ci_check_benchmarks: benchmark_release

[group("CI")]
[parallel]
[private]
ci_build: build_asan build_tsan

[group("CI")]
[parallel]
[private]
ci_tests: test_asan test_tsan

[group("Local")]
pre-commit: fmt lint

# clean everything in build directory
[group("Nuke!")]
[parallel]
clean: clean_debug clean_asan clean_tsan clean_release
