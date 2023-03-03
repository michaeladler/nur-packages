{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, xorg, wayland }:

stdenv.mkDerivation rec {
  pname = "clipboard";
  version = "unstable-2023-03-02";

  src = fetchFromGitHub {
    owner = "Slackadays";
    repo = "Clipboard";
    rev = "9f411bf75b7661869cdf1f946c8c9a9b6a2261db";
    sha256 = "0qx4yzj8hh4f2zavrnq81m8kfzair5ix0x0i6874ad220c5j4vf3";
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
