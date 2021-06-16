#!/usr/bin/env nix-shell
#!nix-shell -p git -p nixUnstable -p niv -p curl -p jq -p bash -p update-nix-fetchgit -i bash
# shellcheck shell=bash
set -eux -o pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
ROOT_DIR=$(readlink -f "${DIR}/..")

source "$DIR/git.inc"

git diff --exit-code >/dev/null

mkdir -p ~/.config/nix
printf "access-tokens = github.com=%s" "$GITHUB_TOKEN" >>~/.config/nix/nix.conf
chmod 600 ~/.config/nix/nix.conf

(cd "$ROOT_DIR" && nix --experimental-features "nix-command flakes" flake update) &
(cd "$ROOT_DIR/pkgs/zig" && ./update.sh) &
(find pkgs -name "*.nix" -not -path "pkgs/zig/*" -print0 | xargs -0 update-nix-fetchgit) &

wait

if [[ -z "$(git diff --exit-code)" ]]; then
    echo "No changes; exiting."
else
    pushd "$ROOT_DIR"
    nix --experimental-features "nix-command flakes" flake check
    git commit -am 'choire: update packages'
    popd
fi

exit 0
