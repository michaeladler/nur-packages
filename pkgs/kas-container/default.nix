{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-11-10";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "64a7cfff027fd451b895be325392dc9f305fd955";
    sha256 = "1n5d329xcsrlphm9dv9pwvajkjnrh5jbrsp1nv0lwaqdwk3dpi1z";
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
