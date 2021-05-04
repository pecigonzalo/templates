with import <nixpkgs> {};

mkShell {
  buildInputs = [
    pkgs.python3
    pkgs.python3.pkgs.poetry
  ];
}
