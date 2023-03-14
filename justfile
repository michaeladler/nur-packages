build PKG:
    nix build --show-trace -L '.#{{ PKG }}'

build-lqx:
    nix build --show-trace -L --no-link '.#linux.lqx' '.#nvidia.lqx' '.#cpupower.lqx'

build-zen:
    nix build --show-trace -L --no-link '.#linux.zen' '.#nvidia.zen' '.#cpupower.zen'

build-linux:
    nix build --show-trace -L --no-link '.#linux.vanilla' '.#nvidia.vanilla' '.#cpupower.vanilla'

build-all:
    sed -E -e 's/(.*)/.#\1/' <pkgs.txt | xargs --delimiter='\n' nix build --show-trace -L --no-link

packagelist:
    #!/usr/bin/env bash
    set -eu
    nix eval --impure --expr 'let flake = builtins.getFlake (toString ./.); in (builtins.toJSON (builtins.attrNames flake.packages.x86_64-linux)) ' \
        | python -c 'import sys, json; raw = input().encode().decode("unicode_escape").strip("\""); pkgs = json.loads(raw); print("\n".join(pkgs))' \
        | tee pkgs.txt

update-all-rust-pkgs:
    #!/usr/bin/env bash
    set -euo pipefail
    git grep -l buildRustPackage -- "*.nix" | while read fname; do
        pname=$(grep "^\s*pname" "$fname" | sed -E -e 's/.*=\s*"(.*)".*/\1/')
        echo "Updating $pname"

        update-nix-fetchgit ./pkgs/$pname/default.nix
        git diff --exit-code ./pkgs/$pname/default.nix || {
            sed -i -E -e 's,cargoHash = .*,cargoHash = lib.fakeHash;,' ./pkgs/$pname/default.nix
            nix build ".#$pname" 1>$pname.log 2>&1 || {
                ACTUAL=$(grep "got: " $pname.log | sed -E -e 's/\s*got:\s+(.*)/\1/')
                sed -i -E -e "s,cargoHash = .*,cargoHash = \"$ACTUAL\";," ./pkgs/$pname/default.nix
            }
            nix build --show-trace -L -v --no-link ".#$pname"
        }

    done

update-all-go-pkgs:
    #!/usr/bin/env bash
    set -euo pipefail
    set -x
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
    find . -name update.sh -type f -executable | while read -r fname; do 
        echo "Running $fname"
        sh -c $fname
    done
    find pkgs -name "*.nix" \
        -not -path "pkgs/pandoc/*" \
        -not -path "pkgs/git-buildpackage/*" \
        -not -path "pkgs/chromium-vimium/*" \
        -not -path "pkgs/chromium-xbrowsersync/*" \
        | while read -r fname; do
            # skip go/rust packages
            grep -E -q "(buildGo|buildRustPackage)" "$fname" || {
                echo "updating $fname"
                update-nix-fetchgit "$fname"
            }
        done

update-flakes:
    nix flake update

update-all: update-flakes update-other update-all-rust-pkgs update-all-go-pkgs

ci-update-packages:
    gh workflow run "update packages"

ci-zen:
    gh workflow run zen

ci-lqx:
    gh workflow run lqx
