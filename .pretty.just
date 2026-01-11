[default]
_default: (_meta::list_recipes source_file())

# run autoformat on: justfile, meson.build files, flake.nix files, cpp/hpp files
[arg("mode", pattern="format|check")]
[group("Pretty")]
fmt mode="format":
    find . -name "*.just" -or -name "justfile" | xargs -I % just {{ if mode == "format" { "" } else { "--check" } }} --fmt --unstable --justfile %
    find . -name "*.nix" | xargs -I % nixfmt --strict {{ if mode == "format" { "" } else { "--verify --check" } }} %
    meson format --recursive {{ if mode == "format" { "--inplace" } else { "--check-only" } }}
    find $(find . -maxdepth 1 -type d | grep -vE "build|subprojects|\\./\\.|(\\.$)" | tr '\n' ' ') -type f -name "*.cpp" -o -name "*.hpp" | xargs clang-format  {{ if mode == "format" { "-i" } else { "--dry-run" } }} --Werror

# run linters: run-clang-tidy
[arg("mode", pattern="fix|check")]
[group("Pretty")]
lint mode="fix":
    @just _meta::build $(just _common_variables::build_root) "" ""
    run-clang-tidy \
      {{ if mode == "fix" { "-fix -format" } else { "" } }} \
      -quiet \
      -p $(just _common_variables::build_root)/DEFAULT \
      $(find . -maxdepth 1 -type d | grep -vE "build|subprojects|\\./\\.|(\\.$)" | tr '\n' ' ')

[group: "Modules"]
mod _meta ".meta.just"
[group: "Modules"]
mod _common_variables ".common_variables.just"
