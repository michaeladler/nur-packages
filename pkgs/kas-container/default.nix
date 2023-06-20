{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-06-18";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "65196e193372599d4c1366fb6e99d4eebc26d302";
    sha256 = "0dliz75dww0fkjmkxmayi9r0r5fihsbzn5bvgpwn1mbx549jkx37";
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
