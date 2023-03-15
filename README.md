[![build](https://github.com/michaeladler/nur-packages/actions/workflows/build.yml/badge.svg)](https://github.com/michaeladler/nur-packages/actions/workflows/build.yml)
[![zen](https://github.com/michaeladler/nur-packages/actions/workflows/build-zen.yml/badge.svg)](https://github.com/michaeladler/nur-packages/actions/workflows/build-zen.yml)
[![update packages](https://github.com/michaeladler/nur-packages/actions/workflows/update.yml/badge.svg)](https://github.com/michaeladler/nur-packages/actions/workflows/update.yml)

# nur-packages

This repository hosts my Nix packages. For a list of packages, see [pkgs.txt](pkgs.txt).

## Cachix

No need to build on your machine:

```bash
$ cachix use nur-packages
```

## Updates

Packages are automatically updated on a __nightly basis__ using GitHub Actions.
