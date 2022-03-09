{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2022-03-08";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "066bec439f4e57f3a41540667a90fb09d9d561fe";
    sha256 = "1rhr7j350kf8rlf8bi83aagiffl5i9rwl2jxl2319a9db6yz5cw4";
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
