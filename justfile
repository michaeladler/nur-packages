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

update-all-rust-pkgs: (update-rust-pkg "aoc-cli") (update-rust-pkg "notmuch-mailmover")

update-all-go-pkgs: (update-rust-pkg "go-crx3") (update-rust-pkg "bed")

update-other:
    #!/usr/bin/env bash
    set -euo pipefail
    find . -name update.sh -type f -executable | xargs -P`nproc` -n1 bash
    find pkgs -name "*.nix" \
        -not -path "pkgs/zig/*" \
        -not -path "pkgs/zls/*" \
        -not -path "pkgs/pandoc/*" \
        -not -path "pkgs/git-buildpackage/*" \
        -not -path "pkgs/git-latest/*" \
        -not -path "pkgs/chromium-vimium/*" \
        -not -path "pkgs/chromium-xbrowsersync/*" \
        | while read -r fname; do
            # skip go/rust packages
            grep -E -q "(buildGo|buildRustPackage)" "$fname" || {
                echo "updating $fname"
                update-nix-fetchgit "$fname"
            }
        done

update-zig:
    #!/usr/bin/env bash
    set -eux
    pkgs/zig/update-special.sh
    update-nix-fetchgit ./pkgs/zls/default.nix

update-flakes:
    nix flake update

update-all: update-flakes update-other update-all-rust-pkgs update-all-go-pkgs

ci-update-packages:
    gh workflow run "update packages"

ci-zen:
    gh workflow run "zen"

update-rust-pkg PKG:
    #!/usr/bin/env bash
    set -eux
    update-nix-fetchgit ./pkgs/{{ PKG }}/default.nix
    git diff --exit-code ./pkgs/{{ PKG }}/default.nix || {
        sed -i -E -e 's,cargoHash = .*,cargoHash = lib.fakeHash;,' ./pkgs/{{ PKG }}/default.nix
        nix build '.#{{ PKG }}' 1>{{ PKG }}.log 2>&1 || {
            ACTUAL=$(grep "got: " {{ PKG }}.log | sed -E -e 's/\s*got:\s+(.*)/\1/')
            sed -i -E -e "s,cargoHash = .*,cargoHash = \"$ACTUAL\";," ./pkgs/{{ PKG }}/default.nix
        }
        nix build --show-trace -L -v --no-link '.#{{ PKG }}'
    }

update-go-pkg PKG:
    #!/usr/bin/env bash
    set -eux
    update-nix-fetchgit ./pkgs/{{ PKG }}/default.nix
    git diff --exit-code ./pkgs/{{ PKG }}/default.nix || {
        sed -i -E -e 's,vendorSha256 = .*,vendorSha256 = lib.fakeSha256;,' ./pkgs/{{ PKG }}/default.nix
        nix build '.#{{ PKG }}' 1>{{ PKG }}.log 2>&1 || {
            ACTUAL=$(grep "got: " {{ PKG }}.log | sed -E -e 's/\s*got:\s+(.*)/\1/')
            sed -i -E -e "s,vendorSha256 = .*,vendorSha256 = \"$ACTUAL\";," ./pkgs/{{ PKG }}/default.nix
        }
        nix build --show-trace -L -v --no-link '.#{{ PKG }}'
    }
