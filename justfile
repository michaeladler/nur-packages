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
    set -euxo pipefail
    pkg=$(basename "$(dirname "{{ FNAME }}")")
    echo "{{ FNAME }}: starting update"
    nix-instantiate --show-trace --expr \
        "let flake = builtins.getFlake (toString ./.); in flake.packages.\${builtins.currentSystem}.\"$pkg\"" \
        --impure >/dev/null
    update_script=$(nix eval --json --impure --expr \
        "let flake = builtins.getFlake (toString ./.); in flake.packages.x86_64-linux.\"$pkg\".updateScript or null" 2>/dev/null)
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
    mapfile -d '' -t files < <(find pkgs -type f -name "*.nix" -print0 | sort -z)
    for file in "${files[@]}"; do
        if [[ "${GITHUB_ACTIONS:-}" == "true" ]]; then
            echo "::group::Updating $file"
        else
            printf '\n==> Updating %s\n' "$file"
        fi

        if just update "$file"; then
            if [[ "${GITHUB_ACTIONS:-}" == "true" ]]; then
                echo "::endgroup::"
            fi
        else
            status=$?
            if [[ "${GITHUB_ACTIONS:-}" == "true" ]]; then
                echo "::endgroup::"
            fi
            printf 'FAILED: %s (exit %d)\n' "$file" "$status" >&2
            exit "$status"
        fi
    done
    echo "Success!"
