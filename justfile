NIX := "nix --experimental-features 'nix-command flakes'"

update-rust-pkg PKG:
    #!/usr/bin/env bash
    set -eux
    update-nix-fetchgit ./pkgs/{{ PKG }}/default.nix
    git diff --exit-code ./pkgs/{{ PKG }}/default.nix || {
        {{ NIX }} build '.#{{ PKG }}' 1>{{ PKG }}.log 2>&1 || {
            EXPECTED=$(grep "specified: " {{ PKG }}.log | sed -E -e 's/\s*specified:\s+(.*)/\1/')
            ACTUAL=$(grep "got: " {{ PKG }}.log | sed -E -e 's/\s*got:\s+(.*)/\1/')
            sed -i -e "s,$EXPECTED,$ACTUAL," ./pkgs/{{ PKG }}/default.nix
        }
        {{ NIX }} build '.#{{ PKG }}'
    }

build-lqx:
    {{ NIX }} build --show-trace -L -v --no-link '.#linux.lqx' '.#nvidia.lqx' '.#cpupower.lqx'

build-zen:
    {{ NIX }} build --show-trace -L -v --no-link '.#linux.zen' '.#nvidia.zen' '.#cpupower.zen'

build-all:
    sed -E -e 's/(.*)/.#\1/' <pkgs.txt | xargs --delimiter='\n' {{ NIX }} build --show-trace -L -v --no-link

packagelist:
    #!/usr/bin/env bash
    set -eu
    {{ NIX }} eval --impure --expr 'let flake = builtins.getFlake (toString ./.); in (builtins.toJSON (builtins.attrNames flake.packages.x86_64-linux)) ' \
        | python -c 'import sys, json; raw = input().encode().decode("unicode_escape").strip("\""); pkgs = json.loads(raw); print("\n".join(pkgs))' \
        | tee pkgs.txt

update-all-rust-pkgs: (update-rust-pkg "aoc-cli")

update-other:
    #!/usr/bin/env bash
    set -eux
    find . -name update.sh -type f -executable | xargs -P$(shell nproc) -n1 sh
    find pkgs -name "*.nix" \
        -not -path "pkgs/zig/*" \
        -not -path "pkgs/zls/*" \
        -not -path "pkgs/pandoc/*" \
        -not -path "pkgs/git-buildpackage/*" \
        -not -path "pkgs/git-latest/*" \
        -not -path "pkgs/aoc-cli/*" \
        -not -path "pkgs/chromium-vimium/*" \
    | xargs -P$(shell nproc) -n1 update-nix-fetchgit

update-zig:
    #!/usr/bin/env bash
    set -eux
    pkgs/zig/update-special.sh
    update-nix-fetchgit ./pkgs/zls/default.nix

update-flakes:
    {{ NIX }} flake update

update-all: update-flakes update-other update-all-rust-pkgs

trigger-ci:
    gh workflow run "update packages"
