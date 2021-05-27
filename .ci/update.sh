#!/usr/bin/env nix-shell
#!nix-shell -p git -p nixUnstable -p niv -p curl -p jq -p bash -i bash
# shellcheck shell=bash
set -eu -o pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
ROOT_DIR="${DIR}/.."

export GIT_AUTHOR_NAME="Github Actions"
export GIT_AUTHOR_EMAIL="actions@github"
export GIT_COMMITTER_NAME=$GIT_AUTHOR_NAME
export GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL

set -x
git diff --exit-code >/dev/null

[ -n "${GITHUB_TOKEN:-}" ] || {
    echo "WARN: Please provide GITHUB_TOKEN to avoid rate-limiting"
    exit 1
}

(cd "$ROOT_DIR" && nix --experimental-features "nix-command flakes" flake update) &
(cd "$ROOT_DIR" && niv update) &
(cd "$ROOT_DIR/pkgs/tmux-plugins-custom" && niv update) &
(cd "$ROOT_DIR/pkgs/vim-plugins-custom" && niv update) &
(cd "$ROOT_DIR/pkgs/zig-nightly" && ./update.sh) &

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
