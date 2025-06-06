{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, libyaml, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2025-06-05";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "cd12d9dd2bea8e4580f458df77229477fc55ba70";
    sha256 = "1mkpn05mnm5bx164bjfppdqwv40jpjw4xnkp0y7lijv3yh360q7c";
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
