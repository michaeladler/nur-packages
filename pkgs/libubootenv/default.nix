{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, libyaml, zlib }:

stdenv.mkDerivation rec {
  pname = "libubootenv";
  version = "unstable-2025-04-26";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "libubootenv";
    rev = "9e2acf27ea0dcfef9bde3ccf43ec247e3750544f";
    sha256 = "1xfndna5bmrda4ifxbj7vqpl4ggzf652arjr9g2lns5chbph41hc";
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
