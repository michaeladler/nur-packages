{ stdenv, lib, fetchFromGitHub, qt5, cmake, pkg-config }:

stdenv.mkDerivation rec {
  pname = "qmarkdown";
  version = "2021-01-01";

  src = fetchFromGitHub {
    owner = "Peterkmoss";
    repo = "qmarkdown";
    rev = "70d74f3f4951f93561f15499a23d9bb4685c0e67";
    sha256 = "1rcym8gnd4gh7ypdbhdl5pfqcs303x8ksz2kcy089vdiklq5gp7f";
  };

  buildInputs = with qt5; [ qtbase qtwebengine qtwebchannel ];

  nativeBuildInputs = [ pkg-config cmake qt5.wrapQtAppsHook ];

  installFlags = [ "DESTDIR=$(out)" "PREFIX=" ];

  installPhase = ''
    mkdir -p $out/bin
    cp qmarkdown $out/bin/
    chmod 0755 $out/bin/*
  '';

  meta = with lib; {
    homepage = "https://github.com/Peterkmoss/qmarkdown";
    description = "minimal markdown viewer";
    platforms = platforms.all;
    license = licenses.gpl3Only;
  };
}
