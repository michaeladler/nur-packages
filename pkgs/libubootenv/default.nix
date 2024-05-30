{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, libyaml, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2024-05-29";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "6b1c689dcce9f57659d07f105986d9f9f8bce2c8";
    sha256 = "0q6qk046nadzna242w3qr3z32h9f0x4hc7dij7lk45zh94l2iqrh";
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
