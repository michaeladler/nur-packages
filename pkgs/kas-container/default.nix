{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-02-07";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "a39d5a00c5597bb5dd9506e33da625cf891eca43";
    sha256 = "0ifaw1rx907mh0sjfgg3pnxvm40d2a5hdd9kzyh2zs03z6d9kidd";
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
