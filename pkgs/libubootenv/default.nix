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
  version = "0.3.8-unstable-2026-11-20";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "b742439f4b0258b877c091340465beacad5a303b";
    sha256 = "sha256-LXx5KTgF5APRXQfmXx99k8GuI7pY/6KoiDDATE5QQcE=";
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
