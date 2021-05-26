{
  description = "My NUR";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        sources = import ./nix/sources.nix;
        callPackage = nixpkgs.legacyPackages.${system}.callPackage;
        recurseIntoAttrs = nixpkgs.legacyPackages.${system}.recurseIntoAttrs;
      in rec {

        # we use legacyPackages for sets of derivations (trees)
        # (flattenTree did not work)
        # https://github.com/numtide/flake-utils/pull/29#issuecomment-817652939
        legacyPackages = {
          vim-plugins-custom =
            recurseIntoAttrs (callPackage ./pkgs/vim-plugins-custom { });
          tmux-plugins-custom = callPackage ./pkgs/tmux-plugins-custom { };
        };

        packages = {
          afew = callPackage ./pkgs/afew { };
          cpio = callPackage ./pkgs/cpio { };
          dwm = callPackage ./pkgs/dwm { inherit sources; };
          dwmblocks = callPackage ./pkgs/dwmblocks { inherit sources; };
          luaprompt = callPackage ./pkgs/luaprompt { inherit sources; };
          neomutt-nightly =
            callPackage ./pkgs/neomutt-nightly { inherit sources; };
          neovim-nightly-unwrapped =
            callPackage ./pkgs/neovim-nightly/unwrapped.nix {
              inherit sources;
            };
          oelint-adv = callPackage ./pkgs/oelint-adv { inherit sources; };
          python3-gbp = callPackage ./pkgs/python3-gbp { inherit sources; };
          vcalendar-filter =
            callPackage ./pkgs/vcalendar-filter { inherit sources; };
          zig-nightly = callPackage ./pkgs/zig-nightly { };
        };

        defaultPackage = packages.luaprompt;

      });
}
