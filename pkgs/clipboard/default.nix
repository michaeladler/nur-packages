{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, xorg, wayland, alsa-lib }:

stdenv.mkDerivation rec {
  pname = "clipboard";
  version = "unstable-2023-06-15";

  src = fetchFromGitHub {
    owner = "Slackadays";
    repo = "Clipboard";
    rev = "871752c6fbb27c1172f8a069b82ccc4909fc176b";
    sha256 = "1az5417sfvn252fbzpw0nld4jrc293gzqb043mg17d1pcwjxqbl1";
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
