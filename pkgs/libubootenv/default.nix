{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2021-08-26";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "057307135464315e692262dff0118af9ff466674";
    sha256 = "04s7bsxgs1vglx5czyphmh3hcdix3zjr80jiwqqgvvj5ix4nh84r";
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
