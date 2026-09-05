build PKG:
    nix build --show-trace -L '.#{{ PKG }}'

build-all:
    #!/usr/bin/env bash
    set -uo pipefail
    mapfile -t pkgs < pkgs.txt
    printf '.#%s\n' "${pkgs[@]}" | xargs --delimiter='\n' nix build --show-trace -L

packagelist:
    #!/bin/sh
    exec nix eval --json --impure --expr 'let flake = builtins.getFlake (toString ./.); in builtins.attrNames flake.packages.x86_64-linux' |
        jq -r 'sort | unique | .[]' |
        tee pkgs.txt

# Update a single package
update FNAME:
    #!/usr/bin/env bash
    set -euo pipefail
    pkg=$(basename "$(dirname "{{ FNAME }}")")
    echo "{{ FNAME }}: starting update"
    nix-update --commit --build --flake --version=branch --use-update-script "$pkg"
    echo "{{ FNAME }}: done"

update-all:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "Updating nix flakes..."
    nix flake update
    echo "Updating packages..."
    find pkgs -name "*.nix" | xargs -r -I{} just update {}
    echo "Success!"
