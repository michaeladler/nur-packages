#!/usr/bin/env nix-shell
#!nix-shell -p bash -p git -p nixUnstable -p update-nix-fetchgit -i "bash -euET -o pipefail -O inherit_errexit"
# shellcheck shell=bash
set -x
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"

mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >>~/.config/nix/nix.conf
printf "access-tokens = github.com=%s" "$GITHUB_TOKEN" >>~/.config/nix/nix.conf
chmod 600 ~/.config/nix/nix.conf

ROOT_DIR=$(readlink -f "${DIR}/..")
cd "$ROOT_DIR" || exit 1

# flakes
(nix --experimental-features "nix-command flakes" flake update) &

# firefox and friends
(nix run '.#firefox-addons-generator' -- pkgs/firefox-addons/addons.json pkgs/firefox-addons/generated-addons.nix) &
(pkgs/firefox-bin/update.sh) &

# everything else
(find pkgs -name "*.nix" -not -path "pkgs/zig/*" -print0 | xargs -0 update-nix-fetchgit) &

wait

git diff --exit-code || {
    nix --experimental-features "nix-command flakes" flake check
    git commit -am 'chore: update packages'
}

exit 0
