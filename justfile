UPDATE_NIX_FETCHGIT := "nix run  'github:NixOS/nixpkgs/nixos-25.11#update-nix-fetchgit'"

build PKG:
    nix build --show-trace -L '.#{{ PKG }}'

build-all:
    #!/usr/bin/env bash
    set -uo pipefail
    mapfile -t pkgs < pkgs.txt
    # Fast path: try building everything at once.
    if printf '.#%s\n' "${pkgs[@]}" | xargs --delimiter='\n' nix build --show-trace -L; then
        exit 0
    fi
    echo "::: bulk build failed, retrying packages individually" >&2
    overall_failed=()
    reverted=()
    for pkg in "${pkgs[@]}"; do
        if nix build --show-trace -L ".#${pkg}"; then
            continue
        fi
        nix_file="pkgs/${pkg}/default.nix"
        if [[ -f $nix_file ]] && ! git diff --quiet -- "$nix_file"; then
            echo "::: ${pkg}: build failed and ${nix_file} is modified, reverting and retrying" >&2
            git checkout -- "$nix_file"
            if nix build --show-trace -L ".#${pkg}"; then
                reverted+=("$pkg")
                continue
            fi
        fi
        overall_failed+=("$pkg")
    done
    if (( ${#reverted[@]} > 0 )); then
        echo "::: reverted packages (build succeeded after revert): ${reverted[*]}" >&2
    fi
    if (( ${#overall_failed[@]} > 0 )); then
        echo "::: packages that still failed: ${overall_failed[*]}" >&2
        exit 1
    fi
    echo "::: build-all succeeded (with ${#reverted[@]} reverts)" >&2

packagelist:
    #!/bin/sh
    exec nix eval --json --impure --expr 'let flake = builtins.getFlake (toString ./.); in builtins.attrNames flake.packages.x86_64-linux' |
        jq -r 'sort | unique | .[]' |
        tee pkgs.txt

# Update a single package
update FNAME:
    #!/usr/bin/env bash
    set -euo pipefail
    dir=$(dirname "{{ FNAME }}")
    echo "{{ FNAME }}: starting update"
    if [[ -x $dir/update.sh ]]; then
        $dir/update.sh
    else
        {{ UPDATE_NIX_FETCHGIT }} "{{ FNAME }}"
    fi
    echo "{{ FNAME }}: done"

update-all:
    #!/usr/bin/env bash
    set -euxo pipefail
    nix flake update
    find pkgs -name "*.nix" | xargs -n1 -P$(nproc) just update
