{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, libyaml, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2024-10-18";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "5507339628b5caf244e1ff9d58cb3fa534b16beb";
    sha256 = "18a1d68j8rwz5vchl6ims88inqsvk3g6r795h3r9abclxa6v4hni";
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
