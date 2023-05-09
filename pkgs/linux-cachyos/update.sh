#!/usr/bin/env bash
set -euo pipefail

PKGBUILD="$(curl -L -s -f https://github.com/CachyOS/linux-cachyos/raw/master/linux-cachyos/PKGBUILD)"

MAJOR=$(echo "$PKGBUILD" | grep -E "^\s*_major")
MAJOR="${MAJOR#*=}"
MINOR=$(echo "$PKGBUILD" | grep -E "^\s*_minor")
MINOR="${MINOR#*=}"

PATCHES_REV=$(curl -s -L -f \ -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    "https://api.github.com/repos/CachyOS/kernel-patches/git/refs/heads/master" | jq -r '.object.sha')
PATCHES_HASH=$(nix-prefetch-url --unpack "https://github.com/CachyOS/kernel-patches/archive/$PATCHES_REV.tar.gz")

SCRIPTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cat <<EOF >"$SCRIPTDIR/metadata.json"
{
  "major": "$MAJOR",
  "minor": "$MINOR",
  "patches_rev": "$PATCHES_REV",
  "patches_hash": "$PATCHES_HASH"
}
EOF
