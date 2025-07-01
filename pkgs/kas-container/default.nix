{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-06-26";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "32f59530e210fd34e56852da56d26e51431b9ad4";
    sha256 = "0vayi9hcsp069c2iz1l4vyhdv0ybfvsnv4sr10nxkk17ap92pzdc";
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
