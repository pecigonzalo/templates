{
  description = "A Nix wrapperd python development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        python = pkgs.python314;
        pythonPackages = python.pkgs;
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            python
            uv
            ruff
            ty
            mypy

            # For C stuff
            stdenv.cc.cc
          ];
          # Required for building C extensions
          LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
        };
      }
    );
}
