{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, libyaml, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2024-10-29";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "0052cdc11ab826192fa08779266073ee132f3940";
    sha256 = "1inz2iymdwxmb316jswawhljllzxikcpgv9jrv7v2ambgr3gqqj5";
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
