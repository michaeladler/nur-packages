{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, xorg }:

stdenv.mkDerivation rec {
  pname = "clipboard";
  version = "unstable-2023-01-15";

  src = fetchFromGitHub {
    owner = "Slackadays";
    repo = "Clipboard";
    rev = "bdcba86279fc3823b31b5aa5aeecff9632f5cda3";
    sha256 = "1ysw9lxad7kkrafgl0188hg0rg5c1h6x18i4fa00vpsrw897pjjy";
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
