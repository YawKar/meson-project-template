[group("Benchmarks")]
build:
    @just _meta::build $(just _common_variables::build_root) "benchmarks_exe" ""

[group("Benchmarks")]
run *ARGS:
    @just _meta::run $(just _common_variables::build_root) "benchmarks_exe" "" {{ ARGS }}

[group: "Modules"]
mod _meta ".meta.just"
