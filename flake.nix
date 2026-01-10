{
  description = "meson-project-template";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-darwin"
        "x86_64-linux"
      ];

      perSystem =
        { pkgs, ... }:
        let
          llvmPkgs = pkgs.llvmPackages_21;
        in
        {
          devShells.default = pkgs.mkShell.override { stdenv = llvmPkgs.libcxxStdenv; } {
            nativeBuildInputs =
              with pkgs;
              [
                meson
                doxygen
                ninja
                pkg-config
                just
                nixfmt
                pre-commit
              ]
              ++ (with llvmPkgs; [
                lld
                lldb
                llvm
                clang-tools
              ]);

            shellHook = ''
              pre-commit uninstall && pre-commit install
              echo "Development shell loaded!"
            '';
          };
        };
    };
}
