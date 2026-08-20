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
  version = "unstable-2026-08-19";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "7eff71784f8cba0789fedf5d3be6cf75618d8a21";
    sha256 = "1q8wfhjbmpz7s19vxkfrn6yw672p5s529vf6f1phwagrmd56avm5";
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
