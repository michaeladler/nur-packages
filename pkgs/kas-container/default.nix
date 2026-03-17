{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2026-03-03";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "226e890f078aa5c72f3b72e0f40a9d29902f6645";
    sha256 = "0gfkdgz32ncnlwqc6xh0qxqpshbw0vbsvx6bwg3qw0wf4nf85zjm";
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
