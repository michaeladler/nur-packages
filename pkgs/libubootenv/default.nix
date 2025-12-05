{
  stdenv,
  lib,
  fetchFromGitHub,
  cmake,
  pkg-config,
  libyaml,
  zlib,
}:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2025-12-04";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "1e3511ed77f794ee5decc0974d54c8e5af26f64c";
    sha256 = "1xsb0nfz7wdv8vsd9nnsqjpb5zrdvdj2a4c3mngziyrghv67s0bk";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
    zlib
    libyaml
  ];

  meta = with lib; {
    homepage = "https://github.com/sbabic/libubootenv";
    description = "Generic library and tools to access and modify U-Boot environment from User Space";
    platforms = platforms.linux;
    license = licenses.lgpl21;
  };
}
