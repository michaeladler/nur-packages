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
  version = "unstable-2026-08-10";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "9d7575d3a342a6fc4ed5059db051ff3b3f83fe54";
    sha256 = "0v5qk5lkih94jg3cd55b2mrfrvg6chhamf6i6vq2mv3czsdlry9n";
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
