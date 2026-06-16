{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2026-06-08";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "6e754f7d1d99ae3f658f5a42c0b9f99cad0cf41f";
    sha256 = "12zm3qvcljf7hr4fva2gbq2wqjfacywq524g26lgng76v2rl1lcn";
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
