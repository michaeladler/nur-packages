
update-rust-pkg PKG:
    #!/usr/bin/env bash
    set -eux
    update-nix-fetchgit ./pkgs/{{PKG}}/default.nix
    git diff --exit-code ./pkgs/{{PKG}}/default.nix || {
        nix build '.#{{PKG}}' 1>{{PKG}}.log 2>&1 || {
            EXPECTED=$(grep "specified: " {{PKG}}.log | sed -E -e 's/\s*specified:\s+(.*)/\1/')
            ACTUAL=$(grep "got: " {{PKG}}.log | sed -E -e 's/\s*got:\s+(.*)/\1/')
            sed -i -e "s,$EXPECTED,$ACTUAL," ./pkgs/{{PKG}}/default.nix
        }
        nix build '.#{{PKG}}'
    }

update-all-rust-pkgs: (update-rust-pkg "aoc-cli")
