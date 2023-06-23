{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, xorg, wayland, alsa-lib }:

stdenv.mkDerivation rec {
  pname = "clipboard";
  version = "unstable-2023-06-23";

  src = fetchFromGitHub {
    owner = "Slackadays";
    repo = "Clipboard";
    rev = "b93c04f452fe1ffb5bb1771e297ebba73ccb9528";
    sha256 = "082hx51lgrhbfznny7jaga2v5qyj04ahrg7h4f1cfjfmn5smqq73";
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
