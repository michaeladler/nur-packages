final: prev:

# Within the overlay we use a recursive set, though I think we can use `self` as well.
rec {
  python3 = prev.python3.override {
    packageOverrides = self: super: {

      libconf = final.callPackage ../pkgs/python-modules/libconf.nix {
        inherit (final) lib;
        inherit (super) buildPythonPackage fetchPypi;
      };

      python-libarchive = final.callPackage ../pkgs/python-modules/python-libarchive.nix {
        inherit (final) lib;
        inherit (super) buildPythonPackage fetchPypi;
      };

      swugenerator = final.callPackage ../pkgs/python-modules/swugenerator {
        #inherit (final) lib fetchFromGitHub;
        inherit (super) buildPythonPackage pytestCheckHook;
        inherit (self) libconf python-libarchive;
      };

    };
  };
  python3Packages = python3.pkgs;

  swugenerator = python3Packages.swugenerator;
}
