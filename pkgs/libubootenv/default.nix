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
  version = "0.3.8-unstable-2026-10-27";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "e47d4af9b932901154efae4daafabe0b1d00b13f";
    sha256 = "sha256-RvABID64tG6X+yiPwM+Q5uviYlRlVWpURUHqI7PYmos=";
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
