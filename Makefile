NIX := nix --experimental-features "nix-command flakes"

.PHONY: update-all
# all but zig
update-all: update-flakes update-other

.PHONY: build-all
build-all:
	sed -E -e 's/(.*)/.#\1/' <pkgs.txt \
		| xargs --delimiter='\n' $(NIX) build --show-trace -L -v --no-link

.PHONY: build-lqx
build-lqx:
	$(NIX) build --show-trace -L -v --no-link '.#linux.lqx' '.#nvidia.lqx' '.#cpupower.lqx'

.PHONY: build-zen
build-zen:
	$(NIX) build --show-trace -L -v --no-link '.#linux.zen' '.#nvidia.zen' '.#cpupower.zen'

.PHONY: update-flakes
update-flakes:
	$(NIX) flake update

.PHONY: update-zig
update-zig:
	pkgs/zig/update-special.sh
	update-nix-fetchgit ./pkgs/zls/default.nix

.PHONY: update-other
update-other:
	find . -name update.sh -type f -executable | xargs -P$(shell nproc) -n1 sh
	find pkgs -name "*.nix" \
		-not -path "pkgs/zig/*" \
		-not -path "pkgs/zls/*" \
		-not -path "pkgs/pandoc/*" \
		-not -path "pkgs/git-buildpackage/*" \
		-not -path "pkgs/git-latest/*" \
		-not -path "pkgs/aoc-cli/*" \
		| xargs -P$(shell nproc) -n1 update-nix-fetchgit

.PHONY: trigger-ci
trigger-ci:
	gh workflow run "update packages"

.PHONY: pkgs.txt
pkgs.txt:
	@echo "Generating package list"
	$(NIX) --experimental-features "nix-command flakes" eval --impure --expr 'let flake = builtins.getFlake (toString ./.); json = builtins.toJSON (builtins.attrNames flake.packages.x86_64-linux); in json ' \
	| python -c 'import sys, json; raw = input().encode().decode("unicode_escape").strip("\""); pkgs = json.loads(raw); print("\n".join(pkgs))' \
	| tee pkgs.txt

