#!/usr/bin/env nix-shell
#!nix-shell -p nixUnstable -p python3 -p bash -i bash
# shellcheck shell=bash
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
ROOT_DIR="${DIR}/.."

set -x
cd "$ROOT_DIR"
nix --experimental-features "nix-command flakes" eval --impure --expr '
    let
      flake = builtins.getFlake (toString ./.);
      json = builtins.toJSON (builtins.attrNames flake.packages.x86_64-linux);
    in
      json
' | python -c 'import sys, json; raw = input().encode().decode("unicode_escape").strip("\""); pkgs = json.loads(raw); print("\n".join(pkgs))'

# vim: ts=2 sw=2 expandtab
