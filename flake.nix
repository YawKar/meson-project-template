{
  description = "meson-project-template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs@{ nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      perSystem =
        { pkgs, system, ... }:
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
                nixfmt-rfc-style
              ]
              ++ (with llvmPkgs; [
                lld
                lldb
                llvm
              ]);

            shellHook = ''
              export CLANGD_FLAGS="-query-driver=$(which clang++)"
              export PS1="(m-p-t)$PS1"
            '';
          };
        };
    };
}
