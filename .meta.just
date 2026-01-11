just := "just --justfile " + source_file()

[default]
_default: (list_recipes source_file())

[group("Generics")]
build root meson_target MESON_ARGS:
    @meson_args="{{ if MESON_ARGS != "" { MESON_ARGS } else { "$(just _common_variables::default_meson_args)" } }}" && \
    builddir=$({{ just }} _get_builddir {{ root }} "$meson_args") && \
    {{ just }} _build "$builddir" "{{ meson_target }}" "$meson_args" && \
    ln --force --relative --symbolic "$builddir" {{ root / "DEFAULT" }}

_build builddir meson_target MESON_ARGS: (_ensure_build_exists builddir MESON_ARGS)
    @meson compile -C {{ builddir }} {{ meson_target }}

_ensure_build_exists builddir MESON_ARGS:
    @if [ ! -d {{ builddir }} ]; then \
      mkdir -p {{ builddir }}; \
      meson setup {{ MESON_ARGS }} {{ builddir }}; \
    fi

[group("Generics")]
run root meson_target MESON_ARGS *ARGS: (build root meson_target MESON_ARGS)
    @meson_args="{{ if MESON_ARGS != "" { MESON_ARGS } else { "$(just _common_variables::default_meson_args)" } }}" && \
    builddir=$({{ just }} _get_builddir {{ root }} "$meson_args") && \
    $({{ just }} _find_executable $builddir {{ meson_target }}) {{ ARGS }}

[group("Utils")]
_find_executable builddir meson_target:
    @realpath --relative-to=. "$(meson introspect {{ builddir }} --targets | jq -r '.[] | select(.name == "{{ meson_target }}") | .filename[0]')"

[group("Utils")]
_get_builddir root MESON_ARGS:
    @echo "{{ root }}/$(just --justfile {{ source_file() }} _hash_meson_args '{{ MESON_ARGS }}')"

# Hashes given MESON_ARGS. Helps maintaining different configurations under 'build/' dir.
[group("Utils")]
_hash_meson_args MESON_ARGS:
    @echo "{{ MESON_ARGS }}" | md5sum -z | cut -f1 -d' '

[group("Utils")]
list_recipes justfile:
    @echo "Variables:"
    @just --evaluate --justfile {{ justfile }} | xargs -I SUBST printf "    %s\n" "SUBST"
    @just --list --unsorted --justfile {{ justfile }}
