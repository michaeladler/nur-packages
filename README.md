[![Build](https://github.com/michaeladler/nur-packages/actions/workflows/build.yml/badge.svg?branch=master)](https://github.com/michaeladler/nur-packages/actions/workflows/build.yml)
[![Update](https://github.com/michaeladler/nur-packages/actions/workflows/update.yml/badge.svg)](https://github.com/michaeladler/nur-packages/actions/workflows/update.yml)

# nur-packages

This repository hosts my Nix packages bundled in a [Nix flake](https://nixos.wiki/wiki/Flakes).
Packages are updated daily using Github Actions.

## Cachix

No need to build on your machine.

```bash
$ cachix use nur-packages
```

## Remarks

* `afew`: my patched version of afew with configurable config file location
* `cpio`: a version of cpio which can handle large files (> 2GB)

## Updates

To avoid being rate-limited, set up an access token for Github in `~/.config/nix/nix.conf`:

```
access-tokens = github.com=23ac...b289
```

See https://nixos.org/manual/nix/unstable/command-ref/conf-file.html.

Then run `nix flake update`.

