default:
  @just --list

build := "build"
debug_build := build / "debug"
asan_build := build / "asan"
tsan_build := build / "tsan"
release_build := build / "release"

## Debug and general development

clean_debug:
  rm -rf {{ debug_build }}

build_debug: clean_debug
  meson setup {{ debug_build }} -Dbuildtype=debug
  meson compile -C {{ debug_build }}

## ASan+UBSan tests

clean_asan:
  rm -rf {{ asan_build }}

build_asan: clean_asan
  meson setup {{ asan_build }} -Dbuildtype=debug -Db_sanitize=address,undefined -Db_lundef=false
  meson compile -C {{ asan_build }}

test_asan: build_asan
  meson test -C {{ asan_build }}

## TSan+UBSan tests

clean_tsan:
  rm -rf {{ tsan_build }}

build_tsan: clean_tsan
  meson setup {{ tsan_build }} -Dbuildtype=debug -Db_sanitize=thread,undefined -Db_lundef=false
  meson compile -C {{ tsan_build }}

test_tsan: build_tsan
  meson test -C {{ tsan_build }}

## Release build

clean_release:
  rm -rf {{ release_build }}

build_release: clean_release
  meson setup {{ release_build }} -Dbuildtype=release
  meson compile -C {{ release_build }}

benchmark_release: build_release
  meson test --benchmark -C {{ release_build }}

## All

clean: clean_debug clean_asan clean_tsan

