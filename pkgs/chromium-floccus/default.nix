{ stdenv, lib, fetchurl, pkgs }:

let metadata = with builtins; fromJSON (readFile ./metadata.json); in

stdenv.mkDerivation rec {
  pname = "chromium-floccus";
  version = metadata.version;

  src = fetchurl {
    inherit (metadata) url sha256;
  };

  unpackPhase = "true";
  buildPhase = "true";

  installPhase = ''
    mkdir -p $out/share/${pname}
    cp $src $out/share/${pname}/${pname}.crx
  '';

  meta = with lib; {
    homepage = "https://github.com/floccusaddon/floccus";
    description = "Sync your bookmarks privately across browsers and devices";
    platforms = platforms.all;
    license = licenses.mpl20;
  };
}
