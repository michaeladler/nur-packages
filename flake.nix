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
          inherit (pkgs) extraLuaJITPackages;
          zenPackages = with pkgs; lib.recurseIntoAttrs (linuxPackagesFor linux-zen);
        });

      packages = forAllSystems (system:
        let pkgs = mkPkgs system; in
        {
          inherit (pkgs)
            age-plugin-yubikey
            bed
            brave
            btrfs-du
            btrfs-list
            checksec
            chromium-browserpass
            chromium-floccus
            chromium-vimium
            chromium-xbrowsersync
            chyle
            cinclude2dot
            clang-format-diff
            clipboard
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
            himalaya
            kas-container
            libubootenv
            luaprompt
            msktutil
            nix-direnv
            notmuch-mailmover
            pam-fprint-grosshack
            pandoc-bin
            qmarkdown
            sbkeys
            skipcpio
            srandrd
            sscep
            sumneko-lua-language-server
            thinkfan
            tlpui
            vcalendar-filter
            waybar-hyprland
            zinit
            zoxide
            ;
        });

    };
}
