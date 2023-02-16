{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, xorg, wayland }:

stdenv.mkDerivation rec {
  pname = "clipboard";
  version = "unstable-2023-02-16";

  src = fetchFromGitHub {
    owner = "Slackadays";
    repo = "Clipboard";
    rev = "1c4a23842141cbb3f3be620257cccb87cd6e7ddc";
    sha256 = "1hvf7krwvda89zl226hsqwyx6mj3s5xdfkzqfqpshnhr5jzz3lwh";
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
