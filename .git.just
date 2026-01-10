[default]
_default: (_meta::list_recipes source_file())

[group("Local")]
pre-commit: _pretty::fmt _pretty::lint

[group: "Modules"]
mod _meta ".meta.just"
[group: "Modules"]
mod _pretty ".pretty.just"
