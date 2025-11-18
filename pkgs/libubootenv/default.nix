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
  version = "unstable-2025-09-19";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "a0cfe61632908d82793af789ab05252dda4fdb5f";
    sha256 = "0lxfdrnkzlbl5ap3926ga5crdnz15jdgs1g1vw0b238aviyyciin";
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
