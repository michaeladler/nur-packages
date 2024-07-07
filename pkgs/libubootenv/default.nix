{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, libyaml, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2024-07-06";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "123383ebf42e4cfa14e0bca3523281fa36443481";
    sha256 = "00jj66z2q7ccw2pp597jq6j7aqcs3mbvyd3iavpp23daiw6r40q5";
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
