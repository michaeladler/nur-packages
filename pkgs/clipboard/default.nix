{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, xorg, wayland, alsa-lib }:

stdenv.mkDerivation rec {
  pname = "clipboard";
  version = "unstable-2023-07-02";

  src = fetchFromGitHub {
    owner = "Slackadays";
    repo = "Clipboard";
    rev = "48a5b40d98a38e0d3e0175f2f721a9eed0e243eb";
    sha256 = "0wry3pmfwxg1i71zyzjnsqkjp9pnwlgbc9l649f3rcwb98infplz";
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
