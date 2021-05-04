with import <nixpkgs> {};

mkShell {
  buildInputs = [
    fsharp
    (with dotnetCorePackages; combinePackages [ sdk_3_1 sdk_5_0 ])
  ];
}
