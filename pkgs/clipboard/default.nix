{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, xorg, wayland, alsa-lib }:

stdenv.mkDerivation rec {
  pname = "clipboard";
  version = "unstable-2023-07-03";

  src = fetchFromGitHub {
    owner = "Slackadays";
    repo = "Clipboard";
    rev = "bd167f12437807e84908a50ccce705377a15b195";
    sha256 = "0w4n437pnilngw0ghdfn55k76ax610hvpndnss09xzqr3n6x4qh5";
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
