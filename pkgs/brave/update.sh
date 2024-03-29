#!/usr/bin/env nix-shell
#!nix-shell -p curl -p bash -p nix-prefetch -p jq -i bash
# shellcheck shell=bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
set -eu

version="$(curl -sL https://brave-browser-apt-release.s3.brave.com/dists/stable/main/binary-amd64/Packages | sed -r -n 's/^Version: (.*)/\1/p' | head -n1)"
if [ -e "$SCRIPT_DIR"/metadata.json ]; then
    old_version=$(jq -r '.version' <"$SCRIPT_DIR"/metadata.json)
else
    old_version=
fi

if [ "$old_version" = "$version" ]; then
    echo "$(date -Iseconds) brave: no update available"
    exit 0
fi

echo "brave: $old_version -> $version"
if command -v notify-send; then
    notify-send -u critical -t -1 "brave" "brave: $old_version -> $version"
fi
url=$(printf "https://github.com/brave/brave-browser/releases/download/v%s/brave-browser_%s_amd64.deb" "$version" "$version")

curl --fail --head "$url" || {
    echo "FATAL: Unable to access $url"
    exit 0
}

sha256=$(nix-prefetch-url "$url")
printf '{"version": "%s", "url": "%s", "sha256": "%s"}\n' "$version" "$url" "$sha256" | jq >"$SCRIPT_DIR/metadata.json"
