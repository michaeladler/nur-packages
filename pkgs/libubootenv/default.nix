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
  version = "0.3.8-unstable-2026-10-30";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "00471de687df86f38ff2cde948d1c60c81ad6a12";
    sha256 = "sha256-uXl7IFodTvo6Y73OldXNlm+qsL1hBpijMbdeTPRRq+I=";
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
