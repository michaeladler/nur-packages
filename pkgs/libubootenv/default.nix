{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2023-02-23";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "ce04db9178fb48d590b098e99189fca67880bcb0";
    sha256 = "0ax28y8r7xp72sjyi5a1zzdms4mc79hg4ng9a3qd0ph1igkadm46";
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
