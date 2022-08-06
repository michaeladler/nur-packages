{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2022-08-05";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "44ecc1c216007272a6f99a104a71c9d410969d9e";
    sha256 = "0gf7ia8xjaj7fg1iwl8qzllzlg82h3h2p9cclcv31i6cbb4dsl93";
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
