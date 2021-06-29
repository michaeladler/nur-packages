final: prev:

let

  pkgs = final.pkgs;

  buildFirefoxXpiAddon = { pname, version, addonId, url, sha256, meta, ... }:
    final.stdenv.mkDerivation {
      name = "${pname}-${version}";

      inherit meta;

      src = prev.fetchurl { inherit url sha256; };

      preferLocalBuild = true;
      allowSubstitutes = false;

      buildCommand = ''
        dst="$out/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
        mkdir -p "$dst"
        install -v -m644 "$src" "$dst/${addonId}.xpi"
      '';
    };

  packages = import ./generated-addons.nix {
    inherit buildFirefoxXpiAddon;
    inherit (prev) fetchurl lib;
    inherit (final) stdenv;
  };

in

packages // { inherit buildFirefoxXpiAddon; }
