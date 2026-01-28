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
  version = "unstable-2026-01-27";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "138114e8c1d2fb64f524fc04e0c99d8290f1201b";
    sha256 = "1fhsy7p1grxpznyfjkqpiwnl4dxxpnkj6lmxdgkc6qp685lkzp63";
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
