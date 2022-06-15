NIX := nix --experimental-features "nix-command flakes"

.PHONY: update-all
# all but zig
update-all: update-flakes update-firefox update-brave update-criterion update-other update-pandoc update-cargo-llvm-cov

.PHONY: build-all
build-all:
	sed -E -e 's/(.*)/.#\1/' <pkgs.txt \
		| xargs --delimiter='\n' $(NIX) build --show-trace -L -v --no-link

.PHONY: build-lqx
build-lqx:
	$(NIX) build --show-trace -L -v --no-link '.#linux.lqx' '.#nvidia.lqx'

.PHONY: build-zen
build-zen:
	$(NIX) build --show-trace -L -v --no-link '.#linux.zen' '.#nvidia.zen'

.PHONY: update-flakes
update-flakes:
	$(NIX) flake update

.PHONY: update-firefox
update-firefox:
	pkgs/firefox-bin-unwrapped/update.sh

.PHONY: update-brave
update-brave:
	pkgs/brave/update.sh

.PHONY: update-criterion
update-criterion:
	pkgs/criterion/update.sh

.PHONY: update-cargo-llvm-cov
update-cargo-llvm-cov:
	cd pkgs/cargo-llvm-cov && ./update.sh

.PHONY: update-zig
update-zig:
	pkgs/zig/update.sh
	update-nix-fetchgit ./pkgs/zls/default.nix

.PHONY: update-other
update-other:
	find pkgs -name "*.nix" \
		-not -path "pkgs/zig/*" \
		-not -path "pkgs/zls/*" \
		-not -path "pkgs/pandoc/*" \
		| while read fname; do echo "updating $$fname"; update-nix-fetchgit "$$fname"; done

.PHONY: update-pandoc
update-pandoc:
	pkgs/pandoc/update.sh

.PHONY: trigger-ci
trigger-ci:
	gh workflow run "update packages"

.PHONY: pkgs.txt
pkgs.txt:
	@echo "Generating package list"
	$(NIX) --experimental-features "nix-command flakes" eval --impure --expr 'let flake = builtins.getFlake (toString ./.); json = builtins.toJSON (builtins.attrNames flake.packages.x86_64-linux); in json ' \
	| python -c 'import sys, json; raw = input().encode().decode("unicode_escape").strip("\""); pkgs = json.loads(raw); print("\n".join(pkgs))' \
	| tee pkgs.txt

