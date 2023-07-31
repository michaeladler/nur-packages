#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
set -euo pipefail

cd "$SCRIPT_DIR"

GH_REPO=andrewrk/poop

OLD_VERSION=$(grep "^\s*version\s*=" default.nix | cut -d '"' -f 2)
VERSION=$(curl --silent "https://api.github.com/repos/$GH_REPO/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')

if [ "$OLD_VERSION" = "$VERSION" ]; then
    echo "poop: no update available"
    exit 0
fi
echo "poop: $OLD_VERSION -> $VERSION"

URL="https://github.com/$GH_REPO/releases/download/$VERSION/x86_64-linux-poop"
SHA256=$(nix-prefetch-url "$URL")

sed -i -e "s/version = \".*\"/version = \"$VERSION\"/g" default.nix
sed -i -e "s/sha256 = \".*\"/sha256 = \"$SHA256\"/g" default.nix
