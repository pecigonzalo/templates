{
  description = "A Nix wrapperd python development environment with Numpy support";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/21.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        python = pkgs.python37;
        pythonPackages = python.pkgs;
      in
      {
        devShell = pkgs.mkShell
          rec {
            buildInputs = with pkgs;
              [
                python

                openblas
                lapack
              ];
            NPY_BLAS_LIBS = "-L${pkgs.openblas}/lib";
            NPY_LAPACK_LIBS = "-L${pkgs.lapack}/lib";
          };
      });
}
