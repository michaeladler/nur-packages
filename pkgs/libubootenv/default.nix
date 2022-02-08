{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2021-12-16";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "10c9a571f1c0472799f72b1924b039aab231e95f";
    sha256 = "1yrvjc9g2zval8y3frcvzklcifyyx094i5f6ivyifiai8742531r";
  };

  nativeBuildInputs = [ cmake pkg-config ];

  buildInputs = [ zlib ];

  meta = with lib; {
    homepage = "https://github.com/sbabic/libubootenv";
    description = "Generic library and tools to access and modify U-Boot environment from User Space";
    platforms = platforms.linux;
    license = licenses.lgpl21;
  };
}
