{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-03-07";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "acf60111b668c3d8a2ef78fa1ca9e92226d7ed00";
    sha256 = "0z5ahrdbxbsha8vggqyfllnz43is4qq29kwj5ajgdm2hlpn4k7k6";
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
