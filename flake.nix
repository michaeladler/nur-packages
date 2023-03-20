{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);

      mkPkgs = system: import nixpkgs {
        inherit system;
        overlays = [ self.overlays.default ];
        config.allowUnfree = true;
      };

    in

    {
      overlays = {
        default = import ./overlay.nix;
      };

      # we have to use legacyPackages for sets of derivations (trees)
      legacyPackages = forAllSystems (system:
        let pkgs = mkPkgs system; in
        {
          inherit (pkgs)
            extraLuaJITPackages
            ;
        });

      packages = forAllSystems (system:
        let pkgs = mkPkgs system; in
        {
          inherit (pkgs)
            age-plugin-yubikey
            brave
            btrfs-du
            btrfs-list
            chromium-browserpass
            chromium-floccus
            chyle
            cinclude2dot
            clang-format-diff
            criterion
            czmod
            efibootguard
            fmtlog
            fzy-lua-native
            git-hours
            go-crx3
            go-mod-outdated
            kas-container
            libubootenv
            luaprompt
            nix-direnv
            pandoc-bin
            qmarkdown
            sbkeys
            skipcpio
            sscep
            sumneko-lua-language-server
            thinkfan
            tlpui
            vcalendar-filter
            zinit
            zoxide
            pam-fprint-grosshack
            srandrd
            git-buildpackage
            chromium-vimium
            chromium-xbrowsersync
            msktutil
            notmuch-mailmover
            bed
            clipboard
            waybar-hyprland
            demo-magic
            checksec
            linux-zen
            ;
        });

    };
}
