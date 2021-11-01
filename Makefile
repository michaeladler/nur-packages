NIX := nix --experimental-features "nix-command flakes"

.PHONY: update-all
update-all: update-flakes update-firefox-addons update-firefox update-brave update-zig update-zls update-other

.PHONY: build-all
build-all:
	sed -E -e 's/(.*)/.#\1/' <pkgs.txt \
		| xargs --delimiter='\n' $(NIX) build --no-link

.PHONY: update-flakes
update-flakes:
	$(NIX) flake update

.PHONY: update-firefox-addons
update-firefox-addons:
	$(NIX) run '.#firefox-addons-generator' -- pkgs/firefox-addons/addons.json pkgs/firefox-addons/generated-addons.nix

.PHONY: update-firefox
update-firefox:
	pkgs/firefox-bin-unwrapped/update.sh

.PHONY: update-brave
update-brave:
	pkgs/brave/update.sh

.PHONY: update-zig
update-zig:
	pkgs/zig/update.sh

.PHONY: update-zls
update-zls:
	update-nix-fetchgit ./pkgs/zls/default.nix

.PHONY: update-other
update-other:
	find pkgs -name "*.nix" \
		-not -path "pkgs/zig/*" \
		-not -path "pkgs/zls/*" \
		| while read fname; do echo "updating $$fname"; update-nix-fetchgit "$$fname"; done

.PHONY: pkgs.txt
pkgs.txt:
	@echo "Generating package list"
	$(NIX) --experimental-features "nix-command flakes" eval --impure --expr 'let flake = builtins.getFlake (toString ./.); json = builtins.toJSON (builtins.attrNames flake.packages.x86_64-linux); in json ' \
	| python -c 'import sys, json; raw = input().encode().decode("unicode_escape").strip("\""); pkgs = json.loads(raw); print("\n".join(pkgs))' \
	| tee pkgs.txt

