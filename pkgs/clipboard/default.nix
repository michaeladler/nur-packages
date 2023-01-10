{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, xorg }:

stdenv.mkDerivation rec {
  pname = "clipboard";
  version = "unstable-2023-01-09";

  src = fetchFromGitHub {
    owner = "Slackadays";
    repo = "Clipboard";
    rev = "91e0f950f66db427634836ae3d9157d9c0945d3d";
    sha256 = "0k9sijdz8fh904fmy7f4zl5p23gil1z3q2r1mw6klhq14qy7nx40";
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
