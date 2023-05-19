{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, xorg, wayland }:

stdenv.mkDerivation rec {
  pname = "clipboard";
  version = "unstable-2023-05-17";

  src = fetchFromGitHub {
    owner = "Slackadays";
    repo = "Clipboard";
    rev = "469c1153e7c5fc97957a5762934a25dbeba8def4";
    sha256 = "1f9b4ind3jlfip95wflavjx01i7d6f9jp0vs5i049iyi952m0h0c";
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
