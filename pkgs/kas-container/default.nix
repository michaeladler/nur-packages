{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2022-01-11";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "3318a5c79ca80bfad26b6057a6af318319233206";
    sha256 = "1pv2mhrf815lkafpwh581fcx3r7lqan1d2s63sc3fx5kf9f5cmjb";
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
