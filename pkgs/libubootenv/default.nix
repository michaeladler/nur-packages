{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, libyaml, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2023-04-01";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "ba3e1e7a980b7fd72e18405633927c6e3d299544";
    sha256 = "1jy58d8ysb2d05kh9h1nzghj797sxlw8vyf5dcc9k1k5zh58i35k";
  };

  nativeBuildInputs = [ cmake pkg-config ];

  buildInputs = [ zlib libyaml ];

  meta = with lib; {
    homepage = "https://github.com/sbabic/libubootenv";
    description = "Generic library and tools to access and modify U-Boot environment from User Space";
    platforms = platforms.linux;
    license = licenses.lgpl21;
  };
}
