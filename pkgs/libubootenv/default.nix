{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, libyaml, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2024-01-22";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "0efb622f16351b4216a0111e0fa0c9c156b96dce";
    sha256 = "0bbmz0gsvgaszvkhib9g73cs7pxw8f178r9krxnvgmm5gmqncx5c";
  };

  nativeBuildInputs = [ cmake pkg-config ];

  buildInputs = [ zlib libyaml ];

  meta = with lib; {
    homepage = "https://github.com/sbabic/libubootenv";
    description = "Generic library and tools to access and modify U-Boot environment from User Space";
    platforms = platforms.linux;
    license = licenses.lgpl21;
  };
}
