#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
curl -Lsf https://ziglang.org/download/index.json | jq .master >"$SCRIPT_DIR/index.json"
