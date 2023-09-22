{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, libyaml, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2023-09-20";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "beb2dc8c33bf80953cb65246d489fbc909e8051f";
    sha256 = "0md1j09r6c2y13rfsmrqdknbvpibycsfjk7xcyfs4pl20pyykh9p";
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
