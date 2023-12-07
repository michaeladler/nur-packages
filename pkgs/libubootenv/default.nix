{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, libyaml, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2023-12-06";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "c478e8d92bd7676a249693f7d132bed7b17ae158";
    sha256 = "0ggmw8mg2fgqw1cg494xb1spdh0i9a8zninkzxsyi8ws1qkrif61";
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
