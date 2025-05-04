{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, libyaml, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2025-05-03";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "94d5ddd665fc40fe2ee401b78486f2bceca4e237";
    sha256 = "1fzqwxmhbimjps9q0kdbsxk0a4l55sbqq2qmh2pjcxng4nirpnz8";
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
