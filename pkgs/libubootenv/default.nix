{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, libyaml, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2023-09-02";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "3a9e42f2d783fafaa81abd5cc22fd54e846551ff";
    sha256 = "1avs57b5n77yna6cwr57562csm68zk3r6i2k4aiknyk9l468gmbj";
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
