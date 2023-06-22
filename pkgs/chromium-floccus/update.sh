#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
set -eu

GH_REPO=floccusaddon/floccus

VERSION=$(curl --silent "https://api.github.com/repos/$GH_REPO/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
VERSION=${VERSION#"v"}
VERSION_OLD=$(jq -r '.version' <"$SCRIPT_DIR"/metadata.json || echo "")

if [ "$VERSION_OLD" = "$VERSION" ]; then
    echo "$GH_REPO: no update available"
    exit 0
fi

echo "Updating from $VERSION_OLD to $VERSION ..."
URL="https://github.com/$GH_REPO/releases/download/${VERSION}/floccus-build-${VERSION}.crx"
SHA256=$(nix-prefetch-url "$URL")

# strip v prefix
VERSION=${VERSION#"v"}
printf '{"version": "%s", "url": "%s", "sha256": "%s"}\n' "$VERSION" "$URL" "$SHA256" >"$SCRIPT_DIR/metadata.json"
