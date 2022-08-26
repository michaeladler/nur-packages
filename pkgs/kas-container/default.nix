{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2022-08-10";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "271f0bf6ca502f02d3b8b9f10335ff13f16b0f57";
    sha256 = "04hpyl28mb3iix4c7m76l0iwl7m6r9hb19h9a5nkky6nl7pjgzdm";
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
