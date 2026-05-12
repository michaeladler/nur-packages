{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }@inputs:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);

      lib = nixpkgs.lib.extend (
        self: super: {
          my = import ./lib {
            inherit inputs;
            lib = self;
          };
        }
      );

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
          else if
            v == "regular" && !(hasPrefix "_" n) && n != "default.nix" && hasSuffix ".nix" n
          then
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
        final: prev:
        nixpkgs.lib.genAttrs packageNames (n: final.callPackage pkgPaths.${n} { });

      otherOverlays = lib.my.mapModules ./overlays import;

      mkPkgs =
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [ packagesOverlay ] ++ (nixpkgs.lib.attrValues otherOverlays);
        };

    in

    {

      overlays = otherOverlays // {
        default = packagesOverlay;
      };

      # we have to use legacyPackages for sets of derivations (trees)
      legacyPackages = forAllSystems (
        system:
        let
          pkgs = mkPkgs system;
        in
        {
          inherit (pkgs) luajitPackages python3Packages;
        }
      );

      packages = forAllSystems (
        system:
        let
          pkgs = mkPkgs system;
        in
        nixpkgs.lib.genAttrs packageNames (n: pkgs.${n})
      );

    };
}
