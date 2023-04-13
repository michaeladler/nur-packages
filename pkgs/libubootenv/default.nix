{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, libyaml, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2023-04-12";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "061e05f90238d4009f14c161db27ecda31b8f2ce";
    sha256 = "06ngpnr83rla3wzjyg5qx7nmqymrg9vk1anh2wa0yr2457q9zxdg";
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
