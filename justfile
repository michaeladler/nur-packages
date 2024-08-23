UPDATE_NIX_FETCHGIT := "nix run  'github:NixOS/nixpkgs/nixos-23.05#update-nix-fetchgit'"

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

update-all-rust-pkgs:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "Updating all Rust packages"
    git grep -l buildRustPackage -- "*.nix" | while read fname; do
        pname=$(grep "^\s*pname" "$fname" | sed -E -e 's/.*=\s*"(.*)".*/\1/')
        echo "Updating $pname"

        {{ UPDATE_NIX_FETCHGIT }} ./pkgs/$pname/default.nix
        git diff --exit-code ./pkgs/$pname/default.nix || {
            sed -i -E -e 's,cargoHash = .*,cargoHash = lib.fakeHash;,' ./pkgs/$pname/default.nix
            sed -i -E -e 's,cargoSha256 = .*,cargoSha256 = lib.fakeHash;,' ./pkgs/$pname/default.nix
            nix build ".#$pname" 1>$pname.log 2>&1 || {
                ACTUAL=$(grep "got: " $pname.log | sed -E -e 's/\s*got:\s+(.*)/\1/')
                sed -i -E -e "s,cargoHash = .*,cargoHash = \"$ACTUAL\";," ./pkgs/$pname/default.nix
                sed -i -E -e "s,cargoSha256 = .*,cargoSha256 = \"$ACTUAL\";," ./pkgs/$pname/default.nix
            }
            nix build --show-trace -L -v --no-link ".#$pname"
        }

    done

update-all-go-pkgs:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "Updating all Go packages"
    git grep -l buildGo -- "./pkgs/*.nix" | while read fname; do
        pname=$(grep "^\s*pname" "$fname" | sed -E -e 's/.*=\s*"(.*)".*/\1/')
        echo "Updating $pname"

        {{ UPDATE_NIX_FETCHGIT }} ./pkgs/$pname/default.nix
        git diff --exit-code ./pkgs/$pname/default.nix || {
            sed -i -E -e 's,vendorHash = .*,vendorHash = lib.fakeHash;,' ./pkgs/$pname/default.nix
            nix build ".#$pname" 1>$pname.log 2>&1 || {
                ACTUAL=$(grep "got: " $pname.log | sed -E -e 's/\s*got:\s+(.*)/\1/')
                sed -i -E -e "s,vendorHash = .*,vendorHash = \"$ACTUAL\";," ./pkgs/$pname/default.nix
            }
            nix build --show-trace -L -v --no-link ".#$pname"
        }

    done

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
        # skip go/rust packages
        grep -E -q "(buildGo|buildRustPackage)" "{{ FNAME }}" || {
            {{ UPDATE_NIX_FETCHGIT }} "{{ FNAME }}"
            echo "{{ FNAME }}: done"
        }
    }

update-flakes:
    nix flake update

update-all: update-flakes update-other update-all-rust-pkgs update-all-go-pkgs

ci-update-packages:
    gh workflow run update
