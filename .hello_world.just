[group("Hello World")]
build:
    @just _meta::build $(just _common_variables::build_root) "hello_world_exe" ""

[group("Hello World")]
run *ARGS:
    @just _meta::run $(just _common_variables::build_root) "hello_world_exe" "" {{ ARGS }}

[group: "Modules"]
mod _meta ".meta.just"
