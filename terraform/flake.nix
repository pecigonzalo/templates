{
  description = "Terraform development template";

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
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfreePredicate =
              pkg:
              builtins.elem (nixpkgs.lib.getName pkg) [
                "terraform"
              ];
          };
        in
        {
          default = pkgs.mkShellNoCC {
            packages = [
              pkgs.bash
              pkgs.terraform
              pkgs.terraform-docs
              pkgs.terraform-ls
              pkgs.tflint
              pkgs.pre-commit
            ];

            shellHook = ''
              export TF_PLUGIN_CACHE_DIR="$PWD/.terraform/plugin-cache"
              mkdir -p "$TF_PLUGIN_CACHE_DIR"
            '';
          };
        }
      );
    };
}
