#!/usr/bin/env nix-shell
#!nix-shell -p nixUnstable -p bash -i bash
# shellcheck shell=bash
set -eux -o pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
ROOT_DIR="${DIR}/.."

cd "$ROOT_DIR"

nix --experimental-features "nix-command flakes" build --no-link '.#zig' '.#zls'
