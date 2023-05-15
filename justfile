build PKG:
    nix build --show-trace -L '.#{{ PKG }}'

build-zen:
    nix-build --keep-failed ci-zen.nix

build-cachyos:
    nix-build --keep-failed ci-cachyos.nix

build-all:
    #!/usr/bin/env bash
    # broken:
    # nix-build-uncached ./ci.nix
    grep -v "^linux" pkgs.txt | sed -E -e 's/(.*)/.#\1/' | xargs --delimiter='\n' nix build --show-trace -L --no-link

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

        update-nix-fetchgit ./pkgs/$pname/default.nix
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

        update-nix-fetchgit ./pkgs/$pname/default.nix
        git diff --exit-code ./pkgs/$pname/default.nix || {
            sed -i -E -e 's,vendorSha256 = .*,vendorSha256 = lib.fakeSha256;,' ./pkgs/$pname/default.nix
            nix build ".#$pname" 1>$pname.log 2>&1 || {
                ACTUAL=$(grep "got: " $pname.log | sed -E -e 's/\s*got:\s+(.*)/\1/')
                sed -i -E -e "s,vendorSha256 = .*,vendorSha256 = \"$ACTUAL\";," ./pkgs/$pname/default.nix
            }
            nix build --show-trace -L -v --no-link ".#$pname"
        }

    done

update-other:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "Updating other packages"
    find . -name update.sh -type f -executable \
        -not -path "pkgs/linux-zen/*" -and -not -path "pkgs/linux-cachyos/*" |
        while read -r fname; do
            echo "Running $fname"
            sh -c "$fname"
        done
    find pkgs -name "*.nix" | while read -r fname; do
        dir=$(dirname "$fname")
        # only update if update.sh does not exist
        [[ -e $dir/update.sh ]] || {
            # skip go/rust packages
            grep -E -q "(buildGo|buildRustPackage)" "$fname" || {
                echo "updating $fname"
                update-nix-fetchgit "$fname"
            }
        }
    done

update-flakes:
    nix flake update

update-all: update-flakes update-other update-all-rust-pkgs update-all-go-pkgs

ci-update-packages:
    gh workflow run update

ci-zen:
    gh workflow run update-linux-zen
