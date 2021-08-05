#!/usr/bin/env nix-shell
#!nix-shell -p curl -p bash -p nix-prefetch -p jq -i bash
# shellcheck shell=bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
set -eu

version="$(curl -sL https://brave-browser-apt-release.s3.brave.com/dists/stable/main/binary-amd64/Packages | sed -r -n 's/^Version: (.*)/\1/p' | head -n1)"
old_version=$(jq -r '.version' <$SCRIPT_DIR/metadata.json)

if [ ! "$old_version" = "$version" ]; then
    echo "Updating from $old_version to $version ..."
    url=$(printf "https://github.com/brave/brave-browser/releases/download/v%s/brave-browser_%s_amd64.deb" "$version" "$version")
    sha256=$(nix-prefetch-url "$url")
    printf '{"version": "%s", "url": "%s", "sha256": "%s"}\n' "$version" "$url" "$sha256" >"$SCRIPT_DIR/metadata.json"
else
    echo "No update available"
fi

