{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-10-22";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "02eeae6c3a0e2f32f8a8aab6b9c211468396ce10";
    sha256 = "1k491bqh30rkb9qiinc0vvfz0ryl8bn1r6jqk339ahg425ahvn29";
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
