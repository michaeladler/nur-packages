#!/usr/bin/env nix-shell
#!nix-shell -p nixUnstable -p bash -i bash
# shellcheck shell=bash
set -eu -o pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
ROOT_DIR="${DIR}/.."

set -x

cd "$ROOT_DIR"

PKGS=$(bash $DIR/extract_pkg_names.sh | sed -E -e 's/(.*)/.#\1/' | tr '\n' ' ')
nix --experimental-features "nix-command flakes" build --no-link $PKGS
