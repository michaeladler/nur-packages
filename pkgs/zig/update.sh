#!/usr/bin/env nix-shell
#!nix-shell -p curl -p jq -p bash -i bash
# shellcheck shell=bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

set -euo pipefail
set -x
curl -Lsf https://ziglang.org/download/index.json | jq .master >"$SCRIPT_DIR/index.json"
