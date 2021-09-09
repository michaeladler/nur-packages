{ stdenv, lib, fetchFromGitHub, qt5, cmake, pkg-config }:

stdenv.mkDerivation rec {
  pname = "qmarkdown";
  version = "unstable-2021-09-08";

  src = fetchFromGitHub {
    owner = "Peterkmoss";
    repo = "qmarkdown";
    rev = "ce08edc5863bdc1d8979d79ad98a626546457fdb";
    sha256 = "1s9sm8c6jdxx2xq514r5ixrl1373xm89g99jg72fjdizijfy51c5";
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
