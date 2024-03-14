{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-03-13";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "154bae8b346143b4ecb36c41117179291ab55b32";
    sha256 = "068gj2dp8qk7y3mx6g9c9wspr7bbqg8n9z656ix1dcvhfk3a3p27";
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
