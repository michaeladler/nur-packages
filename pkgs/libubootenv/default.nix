{
  stdenv,
  lib,
  fetchFromGitHub,
  cmake,
  pkg-config,
  libyaml,
  zlib,
}:

stdenv.mkDerivation {
  pname = "libubootenv";
  version = "0.3.7-unstable-2026-09-28";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "405a596e3f88bd3b7ff290099f71b70702ac911b";
    sha256 = "sha256-fV4uOPAs58EVms5edP6gG0PNuXFWplqNV1jFMKZ7Szk=";
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
