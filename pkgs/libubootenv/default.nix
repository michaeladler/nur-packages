{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, libyaml, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2023-04-04";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "91d06f201e2213afeee7f01f466d5f1e98208e94";
    sha256 = "1zlar774zxzy9jj0g6b2i4iyi1j0mg2zi3h19qiyckgwxlcdsn53";
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
