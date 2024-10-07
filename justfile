UPDATE_NIX_FETCHGIT := "nix run  'github:NixOS/nixpkgs/nixos-24.05#update-nix-fetchgit'"

build PKG:
    nix build --show-trace -L '.#{{ PKG }}'

build-all:
    #!/usr/bin/env bash
    cat pkgs.txt | sed -E -e 's/(.*)/.#\1/' | xargs --delimiter='\n' nix build --show-trace -L --no-link

packagelist:
    #!/usr/bin/env bash
    set -eu
    nix eval --impure --expr 'let flake = builtins.getFlake (toString ./.); in (builtins.toJSON (builtins.attrNames flake.packages.x86_64-linux)) ' \
        | python -c 'import sys, json; raw = input().encode().decode("unicode_escape").strip("\""); pkgs = json.loads(raw); print("\n".join(pkgs))' \
        | tee pkgs.txt

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
