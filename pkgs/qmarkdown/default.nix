{ stdenv, lib, fetchFromGitHub, qt6, cmake, pkg-config }:

stdenv.mkDerivation rec {
  pname = "qmarkdown";
  version = "unstable-2021-12-20";

  src = fetchFromGitHub {
    owner = "Peterkmoss";
    repo = "qmarkdown";
    rev = "9a6e5fdf6f99e16dcbed86efe77258b86f43ad63"; # tags/*
    sha256 = "12bfa7pp51zaifjyamv442dwdk3yp3d4m47g8l65a2vwdkvh792d";
  };

  buildInputs = with qt6; [ qtbase qtwebengine qtwebchannel ];

  nativeBuildInputs = [ pkg-config cmake qt6.wrapQtAppsHook ];

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
