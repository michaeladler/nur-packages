{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, libyaml, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2023-06-02";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "4dfb5254fc0540a36e87914bc14644c047ea7678";
    sha256 = "0ipl1vc12s71d971j4v58xd13z15jhyrahwhmbkbhr38mzlmpyb4";
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
