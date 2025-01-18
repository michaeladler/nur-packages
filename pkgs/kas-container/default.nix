{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-01-13";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "f3056bdbfc263a5866cf001f0de718600620e118";
    sha256 = "07mhyg437bdaxpr7w2i0gaymd84a85kldzmdxibkcg7haybcnbnk";
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
