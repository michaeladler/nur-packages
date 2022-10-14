{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2022-09-30";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "4f51a41ce7f553cbe141acd1395c410aee342a92";
    sha256 = "1m9ylzxkkx9gphzh0il10aw3s8czg6knahbbylai0ahqfzw530bw";
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
