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
  version = "0.3.8-unstable-2026-11-13";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "90ed621b679406dc297a74ea68e702dda2f43044";
    sha256 = "sha256-VYSYWcNCF7AIDdgs+drcWicxol8k8CH3DqgtW5mh0q4=";
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
