#!/usr/bin/env nix-shell
#!nix-shell -p bash -p git -p nixUnstable -p update-nix-fetchgit -i "bash -euET -o pipefail -O inherit_errexit"
# shellcheck shell=bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
cd "${DIR}/.." || exit 1
set -x

NIX=(nix "--experimental-features" "nix-command flakes")

# flakes
("${NIX[@]}" flake update) &

# firefox and friends
("${NIX[@]}" run '.#firefox-addons-generator' -- pkgs/firefox-addons/addons.json pkgs/firefox-addons/generated-addons.nix) &
(pkgs/firefox-bin/update.sh) &

# ungoogled-chromium
(cd pkgs/ungoogled-chromium-bin && ./update.py) &

# everything else
(find pkgs -name "*.nix" -not -path "pkgs/zig/*" -not -path "pkgs/ungoogled-chromium-bin/*" -print0 | xargs -0 update-nix-fetchgit) &

wait

git diff --exit-code || {
    "${NIX[@]}" flake check
    git commit -am 'chore: update packages'
}

exit 0
