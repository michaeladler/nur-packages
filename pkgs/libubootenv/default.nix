{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, libyaml, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2024-04-21";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "5a6f16a26c7e010d6f3e7f7f1a24fd5c21b09041";
    sha256 = "1zfk1rxbbx3qqj80rkzm6sd5gy8qxlcyrcpdi0j9z43d3dbh09dq";
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
