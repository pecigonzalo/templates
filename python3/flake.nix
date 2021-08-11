{
  description = "A Nix wrapperd python development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/21.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        python = pkgs.python39;
        pythonPackages = python.pkgs;
      in
      {
        devShell = pkgs.mkShell rec {
          buildInputs = with pkgs;
            [
              python

              # For C stuff
              stdenv.cc.cc
            ];
          # Required for building C extensions
          LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
        };
      });
}
