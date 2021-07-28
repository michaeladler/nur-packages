{ stdenv, lib, fetchFromGitHub, qt5, cmake, pkg-config }:

stdenv.mkDerivation rec {
  pname = "qmarkdown";
  version = "unstable-2021-07-14";

  src = fetchFromGitHub {
    owner = "Peterkmoss";
    repo = "qmarkdown";
    rev = "d602bd6c012ccb0c6e725e31144b91818b5ce0de";
    sha256 = "1a1q38l33pzqb8xksbbr0z8za51jj17552wwzbszs71zqiwkida1";
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
