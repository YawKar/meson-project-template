[group("Tests")]
build MESON_ARGS="":
    @just _meta::build $(just _common_variables::build_root) "tests_exe" "{{ MESON_ARGS }}"

[group("Tests")]
run MESON_ARGS="" *ARGS:
    @just _meta::run $(just _common_variables::build_root) "tests_exe" "{{ MESON_ARGS }}" {{ ARGS }}

[group: "Modules"]
mod _meta ".meta.just"
