{
  description = "Pulumi TypeScript development template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      forEachSupportedSystem = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      devShells = forEachSupportedSystem (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = pkgs.mkShellNoCC {
            packages = [
              pkgs.nodejs_22
              pkgs.pulumi
              pkgs.pulumiPackages.pulumi-language-nodejs
              pkgs.pre-commit
            ];
          };
        }
      );
    };
}
