{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2026-02-16";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "3e150c0d458673e5106c48aabe0babbc069ca577";
    sha256 = "1rdl50nbzcrb2azsrnz6bvjj5bacv0fhhqhv0gcswyy0l4md2zd5";
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
