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
  version = "0.3.8-unstable-2026-10-16";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "cee53dc417462b5ec20a328e55cd860aef70fd25";
    sha256 = "sha256-vPeLSec3zkz8+392PniMDxGni8CZXVw9h+xGRyzST3c=";
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
