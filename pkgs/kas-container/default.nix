{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2022-04-11";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "5ecef9f91934d117c476e9da3f8ad76fd51097ae";
    sha256 = "15cynzzm64v72jf8165m81wqh6ifk5zcwla3r5kkpp1jpakkdp85";
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
