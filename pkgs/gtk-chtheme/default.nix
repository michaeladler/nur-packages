{ stdenv, lib, fetchurl, pkg-config, gtk2 }:

stdenv.mkDerivation rec {
  pname = "gtk-chtheme";
  version = "0.3.1";

  src = fetchurl {
    url = "http://plasmasturm.org/code//gtk-chtheme/gtk-chtheme-0.3.1.tar.bz2";
    sha256 = "0i7qgm2grzhygcnfg2q7778mk2xipsv41a1cc46x4862c3fvdx16";
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ gtk2 ];

  # patches taken from FreeBSD port
  patches = [
    ./patches/about_dialog.patch
    ./patches/font_sel.patch
    ./patches/main.patch
    ./patches/mainwin.patch
    ./patches/Makefile.patch
    ./patches/preview_pane.patch
    ./patches/theme_sel.patch
    ./patches/util.patch
  ];

  installPhase = ''
    install -D -m0755 gtk-chtheme $out/bin/gtk-chtheme
  '';

  meta = with lib; {
    homepage = "http://plasmasturm.org/programs/gtk-chtheme/";
    description = "GTK2 theme changer";
    maintainers = [ maintainers.michaeladler ];
    platforms = platforms.unix;
    license = licenses.gpl2Plus;
  };
}
