{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, libyaml, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2023-10-06";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "fc9a3991fa09a9326ce140ef3f453acf816a48ea";
    sha256 = "0xbhmkmqg8nh6d4svyh9w7m4d5kf61j0xlg51j0dk9k8n968qcl7";
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
