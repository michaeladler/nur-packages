{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2021-11-17";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "471cdd51e43e57359ed904d4df920f92e00c1471";
    sha256 = "1vv7wspqygwh5zdr1grlg5i30p4l8rx8yjczyhnn0r7gapyv3fbw";
  };

  nativeBuildInputs = [ cmake pkg-config ];

  buildInputs = [ zlib ];

  meta = with lib; {
    homepage = "https://github.com/sbabic/libubootenv";
    description = "Generic library and tools to access and modify U-Boot environment from User Space";
    platforms = platforms.linux;
    license = licenses.lgpl21;
  };
}
