{ stdenv, lib, fetchurl, pkgs }:

let metadata = with builtins; fromJSON (readFile ./metadata.json); in

stdenv.mkDerivation rec {
  pname = "chromium-browserpass";
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
    homepage = "https://github.com/browserpass/browserpass-extension";
    description = "Browserpass web extension";
    platforms = platforms.all;
    license = licenses.isc;
  };
}
