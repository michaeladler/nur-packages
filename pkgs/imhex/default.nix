{ stdenv
, lib
, fetchFromGitHub
, cmake
, pkg-config
, glfw
, mbedtls
, freetype
, gtk3
, python3
, lld
, file
}:

stdenv.mkDerivation {
  pname = "imhex";
  version = "unstable-2022-02-09";

  outputs = [ "out" ];

  src = fetchFromGitHub {
    owner = "WerWolv";
    repo = "ImHex";
    rev = "0e40b8a81a0c9890a45914c948172d07ee054dae";
    sha256 = "02j7gyf786kssp1n134d3q0my11i9ss0d249yliyhi15bklnb3yd";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [ cmake pkg-config python3 lld ];

  buildInputs = [ glfw mbedtls freetype gtk3 file ];

  doCheck = true;

  meta = with lib; {
    description = " A Hex Editor for Reverse Engineers, Programmers and people who value their retinas when working at 3 AM.";
    homepage = "https://github.com/WerWolv/ImHex";
    license = licenses.gpl2Only;
    platforms = platforms.all;
  };
}
