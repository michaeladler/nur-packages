#!/usr/bin/env nix-shell
#!nix-shell -p nixUnstable -p git -p bash -i bash
# shellcheck shell=bash
set -eux -o pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
ROOT_DIR="${DIR}/.."

cd "$ROOT_DIR"

echo "Generating package list"
bash "$DIR/extract_pkg_names.sh" >pkgs.txt

git diff --exit-code pkgs.txt || {
    git add pkgs.txt
    git commit -m 'chore: update package list'
}

sed -E -e 's/(.*)/.#\1/' <pkgs.txt |
    xargs --delimiter='\n' nix --experimental-features "nix-command flakes" build --no-link
