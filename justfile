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

update-other:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "Updating other packages"
    find . -name update.sh -type f -executable | while read -r fname; do
        echo "Running $fname"
        bash -c "$fname"
    done
    find pkgs -name "*.nix" | xargs -n1 -P$(nproc) just _update-one

_update-one FNAME:
    #!/usr/bin/env bash
    set -euo pipefail
    dir=$(dirname "{{ FNAME }}")
    # only update if update.sh does not exist
    [[ -e $dir/update.sh ]] || {
        {{ UPDATE_NIX_FETCHGIT }} "{{ FNAME }}"
        echo "{{ FNAME }}: done"
    }

update-flakes:
    nix flake update

update-all: update-flakes update-other

ci-update-packages:
    gh workflow run update
