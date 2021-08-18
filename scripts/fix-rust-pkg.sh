#!/bin/sh
set -eux

PKG=$1
echo "Fixing $PKG"

ACTUAL_SHA256=$(nix build ".#${PKG}" 2>&1 | grep "got:" | awk '{ print $2; }' | tr -d '[:space:]')
if [ -n "$ACTUAL_SHA256" ]; then
    NIX_FILE="pkgs/$PKG/default.nix"
    sed -i -e "s#\s*cargoSha256\s*=.*#  cargoSha256 = \"$ACTUAL_SHA256\";#" "$NIX_FILE"
    echo "Fixed $NIX_FILE"
fi
