#!/usr/bin/env nix-shell
#!nix-shell -p curl -p jq -p bash -i bash
# shellcheck shell=bash
set -eux
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
# taken from pkgs/development/libraries/rure/update.sh
crate=cargo-llvm-cov
version="$(curl "https://crates.io/api/v1/crates/$crate" | jq -r .crate.max_stable_version)"
url="https://crates.io/api/v1/crates/$crate/$version/download"
prefetch="$(nix-prefetch-url --print-path --type sha256 --unpack "$url")"

cat >"$SCRIPT_DIR/pin.json" <<EOF
{
  "pname": "$crate",
  "version": "$version",
  "sha256": "$(printf '%s' "$prefetch" | head -n1)"
}
EOF
