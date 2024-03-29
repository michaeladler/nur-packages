{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    let
      systems = [
        "x86_64-linux"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);

      mkPkgs = system: import nixpkgs {
        inherit system;
        overlays = [ self.overlays.default self.overlays.python self.overlays.lua ];
        config.allowUnfree = true;
      };

    in

    {
      overlays = {
        default = import ./overlays/common.nix;
        python = import ./overlays/python.nix;
        lua = import ./overlays/lua.nix;
      };

      # we have to use legacyPackages for sets of derivations (trees)
      legacyPackages = forAllSystems (system:
        let pkgs = mkPkgs system; in
        {
          inherit (pkgs) luajitPackages python3Packages;
        });

      packages = forAllSystems (system:
        let pkgs = mkPkgs system; in
        {
          inherit (pkgs)
            age-plugin-yubikey
            asciinema-edit
            atool2
            bed
            brave
            btrfs-du
            btrfs-list
            checksec
            chezmoi
            chromium-browserpass
            chromium-vimium
            chromium-xbrowsersync
            chyle
            cinclude2dot
            clang-format-diff
            colorized-logs
            criterion
            czmod
            demo-magic
            efibootguard
            fmtlog
            fzy-lua-native
            git-buildpackage
            git-hours
            go-crx3
            go-mod-outdated
            gtk-chtheme
            kas-container
            libubootenv
            lua-language-server
            luaprompt
            msktutil
            neovim-unwrapped
            notmuch-mailmover
            pandoc-bin
            poop
            qmarkdown
            sbkeys
            skipcpio
            sscep
            thinkfan
            vcalendar-filter
            zoxide
            ;
        });

    };
}
