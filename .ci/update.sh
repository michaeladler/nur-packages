#!/usr/bin/env nix-shell
#!nix-shell -p git -p nixUnstable -p niv -p curl -p jq -p bash -p update-nix-fetchgit -i bash
# shellcheck shell=bash
set -eu -o pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
ROOT_DIR=$(readlink -f "${DIR}/..")

set -x
git diff --exit-code >/dev/null

mkdir -p ~/.config/nix
printf "access-tokens = github.com=%s" "$GITHUB_TOKEN" >>~/.config/nix/nix.conf
chmod 600 ~/.config/nix/nix.conf

(cd "$ROOT_DIR" && nix --experimental-features "nix-command flakes" flake update) &
(cd "$ROOT_DIR/pkgs/zig" && ./update.sh) &
(find "$ROOT_DIR/pkgs" -name '*.nix' | grep -v 'zig' | while read fname; do
    echo updating "$fname"
    update-nix-fetchgit "$fname"
done)

wait

if [[ -z "$(git diff --exit-code)" ]]; then
    echo "No changes; exiting."
else
    pushd "$ROOT_DIR"
    nix --experimental-features "nix-command flakes" flake check

    export GIT_AUTHOR_NAME="Github Actions"
    export GIT_AUTHOR_EMAIL="actions@github"
    export GIT_COMMITTER_NAME=$GIT_AUTHOR_NAME
    export GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL
    git commit -am 'choire: update packages'
    popd
fi

exit 0
