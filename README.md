# Copier templates

This folder holds [Copier](https://github.com/copier-org/copier) templates for local use.

## Available templates

| Template | Description |
| -------- | ----------- |
| `terraform` | Terraform with AWS provider |
| `python3` | Python 3 project |
| `kotlin` | Kotlin/Gradle application |
| `zig` | Zig application |
| `dotnet` | .NET devshell (Nix) |

## Usage

```sh
copier copy <path-to-templates>/<template> <destination>
```

Example:

```sh
copier copy ./terraform ~/projects/my-infra
```
