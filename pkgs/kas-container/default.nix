{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2026-06-24";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "81bab5294be29de4b64adedce962d36184bfc66f";
    sha256 = "05n9p710v6lrf52b1ahcyb676rp3xqpp1q35il893r86b3fxwi60";
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
