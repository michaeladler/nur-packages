{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-04-08";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "ae69e2f7294399e75e8c110f605149b4aa673c8e";
    sha256 = "15r6c4k03q2ssq45yi7c3lmk8258ajbnkhv03scq20fzrky084ck";
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
