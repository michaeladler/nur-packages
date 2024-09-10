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

update-packages:
    #!/usr/bin/env nix-shell
    #!nix-shell -i bash -p nix-update
    set -euo pipefail
    cat pkgs.txt | while read -r pkg; do
        echo "Updating $pkg"
        nix-update --flake --version=branch "$pkg"
    done

update-flakes:
    nix flake update

update-all: update-flakes update-packages

ci-update-packages:
    gh workflow run update
