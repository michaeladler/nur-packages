#!/usr/bin/env nix-shell
#!nix-shell -p curl -p bash -p nix-prefetch -i bash
# shellcheck shell=bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
set -eu

cd "$SCRIPT_DIR"

version=$(curl https://mirrors.edge.kernel.org/pub/software/scm/git/ |
    grep "git-[0-9\.]*tar.xz" |
    sed -E -e 's,<a href=.*>(.*)</a>.*,\1,' |
    sort -V |
    tail -n1 |
    sed -E -e 's/git-([0-9\.]*)\..*/\1/')
sha256=$(nix-prefetch-url "https://www.kernel.org/pub/software/scm/git/git-${version}.tar.xz")

sed -i -E -e "s/(\s*)version =.*/\1version = \"$version\";/" default.nix
sed -i -E -e "s/(\s*)sha256 =.*/\1sha256 = \"$sha256\";/" default.nix
