[group("Tests")]
build:
    @just _meta::build $(just _common_variables::build_root) "tests_exe" ""

[group("Tests")]
run *ARGS:
    @just _meta::run $(just _common_variables::build_root) "tests_exe" "" {{ ARGS }}

[group: "Modules"]
mod _meta ".meta.just"
