#!/usr/bin/env bash
set -euo pipefail
set -x

git diff --exit-code >/dev/null

if [[ -n ${GITHUB_TOKEN:-} ]] && [[ -f .envrc ]]; then
    source .envrc
fi

[[ -n ${GITHUB_TOKEN:-} ]] || {
    echo "Please provide GITHUB_TOKEN to avoid rate-limit"
    exit 1
}

(niv update) &
(cd ./pkgs/tmux-plugins-custom && niv update) &
(cd ./pkgs/vim-plugins-custom && niv update) &
(cd ./pkgs/zig-nightly && ./update.sh) &

wait

git diff --exit-code >/dev/null || {
    git add .
    git commit -m 'choire: update packages'
}
exit 0
