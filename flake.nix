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
        overlays = [ self.overlays.default self.overlays.python self.overlays.lua ];
        config.allowUnfree = true;
      };

    in

    {
      overlays = {
        default = import ./overlay.nix;
        python = import ./overlay-python.nix;
        lua = import ./overlay-lua.nix;
      };

      # we have to use legacyPackages for sets of derivations (trees)
      legacyPackages = forAllSystems (system:
        let pkgs = mkPkgs system; in
        {
          inherit (pkgs) luajitPackages python3Packages;
          zenPackages = with pkgs; lib.recurseIntoAttrs (linuxPackagesFor linux-zen);
          cachyosPackages = with pkgs; lib.recurseIntoAttrs (linuxPackagesFor linux-cachyos);
        });

      packages = forAllSystems (system:
        let pkgs = mkPkgs system; in
        {
          inherit (pkgs)
            age-plugin-yubikey
            atool2
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
            gitui
            go-crx3
            go-mod-outdated
            kas-container
            libubootenv
            luaprompt
            msktutil
            neovim-unwrapped
            nix-direnv
            notmuch-mailmover
            pam-fprint-grosshack
            pandoc-bin
            qmarkdown
            sbkeys
            skipcpio
            srandrd
            sscep
            lua-language-server
            thinkfan
            tlpui
            vcalendar-filter
            waybar-hyprland
            zinit
            zoxide
            asciinema-edit
            linux-cachyos
            linux-zen
            colorized-logs
            ;
        });

    };
}
