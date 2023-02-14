{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-02-13";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "0e61fdddaff2dd3f90aabf6ea14212c58d1cae8a";
    sha256 = "1qzlw0w48bcxv8fzhnl6x8vyb10cpm9sihq6w6ding73k16i708b";
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
