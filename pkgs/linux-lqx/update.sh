#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
set -euo pipefail

GH_REPO=zen-kernel/zen-kernel

VERSION=$(curl --silent "https://api.github.com/repos/$GH_REPO/releases" |
    jq -r 'map(select(.tag_name | contains("lqx")) | .tag_name) | .[0]')
URL="https://github.com/$GH_REPO/releases/download/$VERSION/$VERSION.patch.xz"

if [[ $VERSION =~ v([0-9]+\.[0-9]+\.[0-9]+)-(.+) ]]; then
    VERSION=${BASH_REMATCH[1]}
    SUFFIX=${BASH_REMATCH[2]}
else
    echo "Unable to extract version number"
    exit 1
fi

VERSION_OLD=$(jq -r '.version' <"$SCRIPT_DIR"/metadata.json || echo "")
if [[ "$VERSION_OLD" = "$VERSION" ]]; then
    echo "$GH_REPO: no update available"
    exit 0
fi

if [[ $VERSION_OLD != "" ]]; then
    VERSION_MAJOR="${VERSION%%.*}"
    rest="${VERSION#*.}"
    VERSION_MINOR="${rest%%.*}"

    VERSION_OLD_MAJOR="${VERSION_OLD%%.*}"
    rest="${VERSION_OLD#*.}"
    VERSION_OLD_MINOR="${rest%%.*}"

    if [[ "$VERSION_OLD_MAJOR" != "$VERSION_MAJOR" ]] || [[ "$VERSION_OLD_MINOR" != "$VERSION_MINOR" ]]; then
        echo "Major/minor mismatch! Skipping update."
        exit 0
    fi
    echo "Updating from $VERSION_OLD to $VERSION ..."
fi

SHA256=$(nix-prefetch-url "$URL")
printf '{"version": "%s", "url": "%s", "suffix": "%s", "sha256": "%s"}\n' "$VERSION" "$URL" "$SUFFIX" "$SHA256" | jq >"$SCRIPT_DIR/metadata.json"
