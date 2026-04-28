{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2026-04-21";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "08047b320d0a6c0291e948966e8fc41ea45aabf5";
    sha256 = "156rvzrnnrasx4prawy7f93kvwxwxgfn24rfdkizg6lba1q4z9ng";
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
