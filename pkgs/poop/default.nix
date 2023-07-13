{ stdenv, lib, fetchurl }:

stdenv.mkDerivation rec {
  pname = "poop";
  version = "0.4.0";

  src = fetchurl {
    url = "https://github.com/andrewrk/poop/releases/download/${version}/x86_64-linux-poop";
    sha256 = "033y4nvg3dzpnpv7l8jqgj2l9pvczrmhq5hwpllrnw9ypznzbx8h";
  };

  unpackPhase = "true";

  dontBuild = true;

  installPhase = ''
    install -D -m0755 $src $out/bin/poop
  '';

  meta = with lib; {
    description = "Performance Optimizer Observation Platform";
    homepage = "https://github.com/andrewrk/poop";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
