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
            # we will explicitly set D_FORTIFY_SOURCE
            hardeningDisable = [
              "fortify"
              "fortify3"
            ];

            nativeBuildInputs = with pkgs; [
              # Build system
              meson
              ninja
              pkg-config

              # Toolchain
              llvmPkgs.clang-tools
              llvmPkgs.lld
              llvmPkgs.llvm

              # Performance analysis
              valgrind
              hotspot
              heaptrack

              # Debugging
              gef
              llvmPkgs.lldb

              # Automation
              just
              pre-commit

              # Formatters & Linters
              nixfmt

              # Documentation
              doxygen
            ];

            shellHook = ''
              pre-commit uninstall && pre-commit install
              echo "🚀 Modern C++ Environment with Meson"
              just
            '';
          };
        };
    };
}
