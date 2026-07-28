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
  version = "unstable-2026-07-27";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "c421174006d5c6ffd817fb8ded9a5873a2f6f003";
    sha256 = "01z2dfkm2g99w5phjskrqqnjmdz9wi4kjvjbnsws2mz0gpw6shq6";
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
