#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
cd "$SCRIPT_DIR"

GH_OWNER=xbrowsersync
GH_REPO=app

echo "Updating $GH_OWNER/$GH_REPO"

LATEST_RELEASE_TAG=$(curl --header "Authorization: token $GITHUB_TOKEN" --silent "https://api.github.com/repos/$GH_OWNER/$GH_REPO/releases/latest" | jq -r .tag_name)
LATEST_RELEASE_TAG=${LATEST_RELEASE_TAG:1}
OUR_TAG=$(grep "^\s*version\s*=" default.nix | awk -F= '{print $2;}' | tr -d '"; ')

if [[ "$LATEST_RELEASE_TAG" != "$OUR_TAG" ]]; then
    sed -E -e "s/\s*version\s*=.*/  version = \"$LATEST_RELEASE_TAG\";/" -i default.nix
    DOWNLOAD_URL=$(grep "^\s*url\s*=" default.nix | awk -F= '{print $2;}' | tr -d '"; ' | env "version=$LATEST_RELEASE_TAG" envsubst)
    NEW_HASH=$(nix-prefetch-url "$DOWNLOAD_URL")
    sed -i -E -e "s/\s*sha256\s*=.*/    sha256 = \"$NEW_HASH\";/" default.nix
fi
