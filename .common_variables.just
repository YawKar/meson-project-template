build_root := "build"

build_root:
    @echo {{ build_root }}

default_sanitizers := asan + "," + ubsan
asan := "address"
tsan := "thread"
msan := "memory"
ubsan := "undefined"

default_meson_args:
    @echo "-Db_sanitize={{ default_sanitizers }}"
