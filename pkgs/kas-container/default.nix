{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-10-09";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "73495a7ddb4f9a0f82d23b07e0f397d9a2420992";
    sha256 = "1f7q2vqy1lij04k1bmp3q15anchd81hkmv85a4cb24icgspvy7vd";
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
