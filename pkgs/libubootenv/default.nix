{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2022-09-05";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "108100622160bb0c7ef4b6186230fe1f26402791";
    sha256 = "06kykp98lbzdsxcg0pdcvma29gh30h53q61a2qbljs0vypxnj1h5";
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
