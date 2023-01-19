{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-01-17";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "dc44638cd87c4d0045ea2ca441e682f3525d8b91";
    sha256 = "1kjjr06lnaj7v6axc8wcwj02acpxjkjy0092fva5nwcv42mmpdpj";
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
