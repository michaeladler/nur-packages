{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, libyaml, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2024-05-10";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "248ae58fc559c1140937b49c0fead1091d8c6d7b";
    sha256 = "1i7aaxgzigppnbbjw8dhda7vccqq4fig15alw05zhrkhr7wzpfff";
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
