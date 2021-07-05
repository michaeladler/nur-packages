#!/usr/bin/env nix-shell
#!nix-shell -p git -p bash -i bash
# shellcheck shell=bash
set -eux -o pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"

git diff --exit-code >/dev/null

ROOT_DIR=$(readlink -f "${DIR}/..")
"$ROOT_DIR"/pkgs/zig/update.sh

git diff --exit-code || git commit -am 'chore: update zig'

exit 0
