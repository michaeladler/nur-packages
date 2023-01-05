{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, xorg }:

stdenv.mkDerivation rec {
  pname = "clipboard";
  version = "unstable-2023-01-04";

  src = fetchFromGitHub {
    owner = "Slackadays";
    repo = "Clipboard";
    rev = "efcd806b939909bf6431248b05a077e840aa60df";
    sha256 = "1723m1r0j1lj1fgjjdg3cdp5q8kkr74a7q4i6l9b7051ljprxmqb";
  };

  nativeBuildInputs = [ pkg-config cmake ];

  buildInputs = [ xorg.libX11 ];

  meta = with lib; {
    homepage = "https://github.com/Slackadays/Clipboard";
    description = "Cut, copy, and paste anything, anywhere, all from the terminal";
    platforms = platforms.all;
    license = licenses.gpl3Only;
  };
}
