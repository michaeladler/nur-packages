{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, libyaml, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2025-07-29";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "5e6d8b6318be809ac5a8989756ade45ece88ca7e";
    sha256 = "1pxk24dq3qnd2i2wmpp3j2ylpn0ciqifbizkl690y233425vszsf";
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
