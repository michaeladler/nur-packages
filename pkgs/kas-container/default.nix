{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-02-12";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "2694ad64bfa258e8fbdc984cde41ff37f35e9fd7";
    sha256 = "06zj1jhqmfxkny2m09sx549i66qag2jka2hcgh7rl5bkbq6qs717";
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
