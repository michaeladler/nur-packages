{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-02-20";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "8f6043048936c09c1c47487b071598120b798edd";
    sha256 = "1r3lldl85hhdwj5i1g8vbyjrlz0b48fg77cpdv1dfdf2qwypp5ff";
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
