{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2021-11-02";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "7dbfffa4cc0e42ad3febb122a711fe9d1b20e9f7";
    sha256 = "02hak09cm2amjr39fkdb0fx67134bn4inijp3fvrn5piscm6blb0";
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
