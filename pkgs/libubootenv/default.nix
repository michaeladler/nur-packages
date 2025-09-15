{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, libyaml, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2025-09-14";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "7b3b78b6f09776f6413bffc492fce359926a3469";
    sha256 = "1z5ij1k5hyvy2nisbl4fnijlyv7ia3hdjww42qxh5yrcviq3sxzh";
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
