{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-01-24";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "b27ab659f3e800a94ca8e11825ffeba9907cb7a4";
    sha256 = "1vwmmj21agjkarz195rq26z7p650zm349rb0m58s8cq2rwmalv62";
  };

  installPhase = ''
    install -D -m0755 kas-container $out/bin/kas-container
  '';

  meta = with lib; {
    homepage = "https://github.com/siemens/kas";
    description = "Setup tool for bitbake based projects";
    platforms = platforms.all;
    license = licenses.mit;
  };
}
