{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-11-18";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "874005dc0a497bc81560877a1f26d5207529ea29";
    sha256 = "0ia9d28zd7pcgbmlwaq6gk65g7xwjd1njq3618gs3rqh2vzrx3am";
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
