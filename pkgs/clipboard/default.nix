{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, xorg }:

stdenv.mkDerivation rec {
  pname = "clipboard";
  version = "unstable-2023-01-16";

  src = fetchFromGitHub {
    owner = "Slackadays";
    repo = "Clipboard";
    rev = "ce51ca007479464a924ae0275997ea9c47bbb49f";
    sha256 = "05rdg10nvwwqkshm67xk16z2mmnjmrydxvrni63ardrin16p8skh";
  };

  nativeBuildInputs = [ pkg-config cmake ];

  buildInputs = [ xorg.libX11 ];

  cmakeFlags = [
    "-DINSTALL_PREFIX=$out"
  ];

  meta = with lib; {
    homepage = "https://github.com/Slackadays/Clipboard";
    description = "Cut, copy, and paste anything, anywhere, all from the terminal";
    platforms = platforms.all;
    license = licenses.gpl3Only;
  };
}
