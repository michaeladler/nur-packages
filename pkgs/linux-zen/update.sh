#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
set -eu

GH_REPO=zen-kernel/zen-kernel

VERSION=$(curl --silent "https://api.github.com/repos/$GH_REPO/releases" |
    jq -r 'map(select(.tag_name | contains("zen")) | .tag_name) | .[0]')
if [[ $VERSION =~ v([0-9]+\.[0-9]+\.[0-9]+)-(.+) ]]; then
    version=${BASH_REMATCH[1]}
    zen_suffix=${BASH_REMATCH[2]}
else
    echo "Unable to extract version number"
    exit 1
fi

VERSION_OLD=$(jq -r '.version' <"$SCRIPT_DIR"/metadata.json || echo "")
if [ "$VERSION_OLD" = "$version" ]; then
    echo "$GH_REPO: no update available"
    exit 0
fi

URL="https://github.com/$GH_REPO/releases/download/$VERSION/$VERSION.patch.xz"
SHA256=$(nix-prefetch-url "$URL")

# example: v6.2.6-zen1
echo "Updating from $VERSION_OLD to $VERSION ..."

printf '{"version": "%s", "zen_url": "%s", "zen_suffix": "%s", "zen_sha256": "%s"}\n' "$version" "$URL" "$zen_suffix" "$SHA256" | jq >"$SCRIPT_DIR/metadata.json"
