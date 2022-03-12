{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2022-03-11";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "9ddccfc18c2801b07a6e88a17a7b20089372f318";
    sha256 = "0xsry732vmvhw3rmfcsammqqg4sqdl06fjhw18p78vdr1f5dm6lq";
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
