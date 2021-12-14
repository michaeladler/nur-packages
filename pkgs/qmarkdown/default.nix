{ stdenv, lib, fetchFromGitHub, qt5, cmake, pkg-config }:

stdenv.mkDerivation rec {
  pname = "qmarkdown";
  version = "unstable-2021-12-14";

  src = fetchFromGitHub {
    #owner = "Peterkmoss";
    owner = "michaeladler";
    repo = "qmarkdown";
    rev = "d03f3dfffa2a779695c9f3f05515296cdc8225d8";
    sha256 = "0jv9nn35393cx42j2s8ci7jjry6bxgr8f6qm0lrmax547indf53a";
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
