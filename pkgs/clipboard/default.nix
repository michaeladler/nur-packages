{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, xorg, wayland }:

stdenv.mkDerivation rec {
  pname = "clipboard";
  version = "unstable-2023-03-06";

  src = fetchFromGitHub {
    owner = "Slackadays";
    repo = "Clipboard";
    rev = "9f67e70541a9add09300e3a12c68e42ff7796577";
    sha256 = "10xgp3h1vm71380drc0rvvlv32ild00g43krv7hzm1m50iglgsbr";
  };

  nativeBuildInputs = [ pkg-config cmake ];

  buildInputs = [ xorg.libX11 wayland ];

  postPatch = ''
    substituteInPlace CMakeLists.txt \
      --replace 'INSTALL_PREFIX "/usr"' "INSTALL_PREFIX $out"
  '';

  meta = with lib; {
    homepage = "https://github.com/Slackadays/Clipboard";
    description = "Cut, copy, and paste anything, anywhere, all from the terminal";
    platforms = platforms.all;
    license = licenses.gpl3Only;
  };
}
