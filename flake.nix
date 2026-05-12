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

      mkPkgs =
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

    in

    {

      overlays = (lib.my.mapModules ./overlays import) // {
        default = final: prev: self.packages.${prev.stdenv.hostPlatform.system} or { };
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
        lib.my.mapModules ./pkgs (x: pkgs.callPackage x { })
      );

    };
}
