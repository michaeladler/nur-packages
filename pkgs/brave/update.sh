#!/usr/bin/env nix-shell
#!nix-shell -p curl -p bash -p nix-prefetch -p jq -i bash
# shellcheck shell=bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
set -eu

version="$(curl -sL https://brave-browser-downloads.s3.brave.com/latest/release.version)"
old_version=$(jq -r '.version' <"$SCRIPT_DIR"/metadata.json)

if [ "$old_version" = "$version" ]; then
    echo "brave: no update available"
    exit 0
fi

echo "brave: $old_version -> $version"
url=$(printf "https://github.com/brave/brave-browser/releases/download/v%s/brave-browser_%s_amd64.deb" "$version" "$version")
sha256=$(nix-prefetch-url "$url")
printf '{"version": "%s", "url": "%s", "sha256": "%s"}\n' "$version" "$url" "$sha256" >"$SCRIPT_DIR/metadata.json"
