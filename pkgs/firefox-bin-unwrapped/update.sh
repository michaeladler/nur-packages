#!/usr/bin/env nix-shell
#!nix-shell -p curl -p jq -p bash -p nix-prefetch -i bash
# shellcheck shell=bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
set -eu

FF_VERSION=$(curl -Ls https://product-details.mozilla.org/1.0/firefox.json | grep '"version":' | awk -F: '{print $2;}' | sort -V | grep -E -v '.*b[0-9]+"$' | tail -n1 | tr -d '" ')
FF_VERSION_OLD=$(jq -r '.version' <"$SCRIPT_DIR"/metadata.json)

if [ ! "$FF_VERSION_OLD" = "$FF_VERSION" ]; then
    echo "Updating from $FF_VERSION_OLD to $FF_VERSION ..."
    FF_URL="https://archive.mozilla.org/pub/firefox/releases/${FF_VERSION}/linux-x86_64/en-US/firefox-${FF_VERSION}.tar.bz2"
    FF_SHA256=$(nix-prefetch-url "$FF_URL")
    printf '{"version": "%s", "url": "%s", "sha256": "%s"}\n' "$FF_VERSION" "$FF_URL" "$FF_SHA256" >"$SCRIPT_DIR/metadata.json"
else
    echo "No update available"
fi
