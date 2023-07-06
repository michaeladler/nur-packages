{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, libyaml, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2023-06-15";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "9f17a00ee56dc5cfb1d9b51e6639d67b64cb3309";
    sha256 = "12syi027rrvq68zc75ipc68x05h53qdgj2bylgcsc7d2ilprc7a7";
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
