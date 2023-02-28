#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
set -eu

GH_REPO=zellij-org/zellij

VERSION=$(curl --silent "https://api.github.com/repos/$GH_REPO/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
VERSION=${VERSION#"v"}
VERSION_OLD=
if [[ -e metadata.json ]]; then
    VERSION_OLD=$(jq -r '.version' <"$SCRIPT_DIR"/metadata.json || echo "")
fi

if [ "$VERSION_OLD" = "$VERSION" ]; then
    echo "$GH_REPO: no update available"
    exit 0
fi

echo "Updating from $VERSION_OLD to $VERSION ..."
URL="https://github.com/zellij-org/zellij/releases/download/v${VERSION}/zellij-x86_64-unknown-linux-musl.tar.gz"
SHA256=$(nix-prefetch-url "$URL")
printf '{"version": "%s", "url": "%s", "sha256": "%s"}\n' "$VERSION" "$URL" "$SHA256" >"$SCRIPT_DIR/metadata.json"
