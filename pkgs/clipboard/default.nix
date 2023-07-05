{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, xorg, wayland, alsa-lib }:

stdenv.mkDerivation rec {
  pname = "clipboard";
  version = "unstable-2023-07-04";

  src = fetchFromGitHub {
    owner = "Slackadays";
    repo = "Clipboard";
    rev = "4dd60a0f2cf6a1e7ddb873633cd70165bc143aa2";
    sha256 = "1nvhiyx4dg4hg6fvw7xsh1v2wdg8mhq1r8pbqgfiac06rhzycd16";
  };

  nativeBuildInputs = [ pkg-config cmake ];

  buildInputs = [ xorg.libX11 wayland alsa-lib ];

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
