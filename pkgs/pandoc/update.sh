#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
set -eu

GH_REPO=jgm/pandoc

VERSION=$(curl --silent "https://api.github.com/repos/$GH_REPO/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
VERSION_OLD=$(jq -r '.version' <"$SCRIPT_DIR"/metadata.json || echo "")

if [ "$VERSION_OLD" = "$VERSION" ]; then
    echo "$GH_REPO: no update available"
    exit 0
fi

echo "$GH_REPO: $VERSION_OLD -> $VERSION"
URL="https://github.com/$GH_REPO/releases/download/$VERSION/pandoc-$VERSION-linux-amd64.tar.gz"
SHA256=$(nix-prefetch-url "$URL")
printf '{"version": "%s", "url": "%s", "sha256": "%s"}\n' "$VERSION" "$URL" "$SHA256" >"$SCRIPT_DIR/metadata.json"
