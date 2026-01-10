[default]
[private]
default:
    @just _meta::list_recipes {{ source_file() }}

[group: "Main modules"]
mod hello_world ".hello_world.just"
[group: "Main modules"]
mod tests ".tests.just"
[group: "Main modules"]
mod benchmarks ".benchmarks.just"
[group: "Main modules"]
mod pretty ".pretty.just"
[group: "Support modules"]
mod _meta ".meta.just"
[group: "Support modules"]
mod _common_variables ".common_variables.just"
[group: "Support modules"]
mod _git ".git.just"

# clean everything in build directory
[group("Nuke!")]
[parallel]
clean:
    @rm -rf $(just _common_variables::build_root)

alias nuke := clean
