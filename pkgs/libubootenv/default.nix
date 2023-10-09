{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, libyaml, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2023-10-08";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "3f4d15e36ceb58085b08dd13f3f2788e9299877b";
    sha256 = "1w7qm0d39nbyi3s860w3j3v8c4vncw5ab9lw1a0k659sa1pi9f4b";
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
