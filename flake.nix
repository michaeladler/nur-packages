{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);

      # Discover packages under ./pkgs as { name = path; }. This must not
      # force values, otherwise applying the overlay below leads to infinite
      # recursion in nixpkgs' stdenv booter (it forces attr values to
      # determine the overlay's attribute set).
      pkgPaths =
        let
          inherit (builtins) readDir pathExists;
          inherit (nixpkgs.lib)
            mapAttrs'
            hasPrefix
            hasSuffix
            nameValuePair
            removeSuffix
            ;
          entries = readDir ./pkgs;
        in
        mapAttrs' (
          n: v:
          let
            path = ./pkgs + "/${n}";
          in
          if v == "directory" && !(hasPrefix "_" n) && pathExists (path + "/default.nix") then
            nameValuePair n path
          else if v == "regular" && !(hasPrefix "_" n) && n != "default.nix" && hasSuffix ".nix" n then
            nameValuePair (removeSuffix ".nix" n) path
          else
            nameValuePair "__skip_${n}" null
        ) entries;

      packageNames = builtins.filter (n: !nixpkgs.lib.hasPrefix "__skip_" n) (
        builtins.attrNames pkgPaths
      );

      # The packages overlay is the source of truth: it adds every package
      # under ./pkgs to nixpkgs. `packages` and `legacyPackages` are derived
      # from a nixpkgs instance with this overlay applied.
      packagesOverlay =
        final: prev: nixpkgs.lib.genAttrs packageNames (n: final.callPackage pkgPaths.${n} { });

      mkPkgs =
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [ packagesOverlay ];
        };

    in

    {

      overlays.default = packagesOverlay;

      packages = forAllSystems (
        system:
        let
          pkgs = mkPkgs system;
        in
        nixpkgs.lib.genAttrs packageNames (n: pkgs.${n})
      );

    };
}
