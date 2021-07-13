#!/usr/bin/env nix-shell
#!nix-shell -p curl -p bash -p nix-prefetch -i bash
# shellcheck shell=bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
set -eux

version="$(curl -sL https://brave-browser-apt-release.s3.brave.com/dists/stable/main/binary-amd64/Packages | sed -r -n 's/^Version: (.*)/\1/p' | head -n1)"
url=$(printf "https://github.com/brave/brave-browser/releases/download/v%s/brave-browser_%s_amd64.deb" "$version" "$version")
sha256=$(nix-prefetch-url "$url")

printf '{"version": "%s", "url": "%s", "sha256": "%s"}\n' "$version" "$url" "$sha256" >"$SCRIPT_DIR/metadata.json"
