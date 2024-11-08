{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);

      mkPkgs = system: import nixpkgs {
        inherit system;
        overlays = [ self.overlays.default self.overlays.python ];
        config.allowUnfree = true;
      };

    in

    {
      overlays = {
        default = import ./overlays/common.nix;
        python = import ./overlays/python.nix;
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
            asciinema-edit
            bed
            btrfs-list
            cinclude2dot
            colorized-logs
            demo-magic
            efibootguard
            extension-downloader
            fmtlog
            go-mod-outdated
            kanshi
            kas-container
            libubootenv
            notmuch-mailmover
            river-bsp-layout
            skipcpio
            vcalendar-filter
            zoxide
            ;
        });

    };
}
