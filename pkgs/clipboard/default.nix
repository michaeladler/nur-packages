{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, xorg, wayland }:

stdenv.mkDerivation rec {
  pname = "clipboard";
  version = "unstable-2023-01-27";

  src = fetchFromGitHub {
    owner = "Slackadays";
    repo = "Clipboard";
    rev = "20b81be703249e91f0dca108252b671195287795";
    sha256 = "0441sjsmyfi79c0v7560lad7kv52k41x6cy1q6mk50cr7vlz9s54";
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
