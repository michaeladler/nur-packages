build PKG:
    nix build --print-out-paths --show-trace -L '.#{{ PKG }}'

# nix build --print-out-paths pipes push only the runtime closure; this pushes
# the full build closure so the package builds without downloading build deps.
push PKG cache="michaeladler":
    nix-store -qR --include-outputs $(nix-store -qd $(nix build --print-out-paths -L '.#{{ PKG }}')) | grep -v '\.drv$' | cachix push {{ cache }}

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
    update_script=$(nix eval --json --impure --expr \
        "let flake = builtins.getFlake (toString ./.); in flake.packages.x86_64-linux.\"$pkg\".updateScript or null")
    mapfile -t update_cmd < <(jq -r 'if type == "array" then .[] else empty end' <<<"$update_script")
    if ((${#update_cmd[@]})); then
        # Run nix-update directly; --use-update-script re-evaluates a stale flake snapshot.
        "${update_cmd[0]}" --commit --build "${update_cmd[@]:1}" "$pkg"
    else
        nix-update --commit --build --flake --version=branch "$pkg"
    fi
    echo "{{ FNAME }}: done"

update-all:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "Updating nix flakes..."
    nix flake update
    echo "Updating packages..."
    find pkgs -name "*.nix" | xargs -n1 just update
    echo "Success!"
