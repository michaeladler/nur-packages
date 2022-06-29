{ stdenv
, lib
, fetchFromGitHub
, cmake
, fmt_8
, enableShared ? !stdenv.hostPlatform.isStatic
}:

stdenv.mkDerivation {
  pname = "fmtlog";
  version = "unstable-2022-06-28";

  outputs = [ "out" "dev" ];

  src = fetchFromGitHub {
    owner = "MengRao";
    repo = "fmtlog";
    rev = "63b330ab426e3295fe62529da7f8c0053f2a905a";
    sha256 = "01q2s6zpb919czgp6kmkq4yydypyz9i2l0qhflmq4431ggj6ha9p";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [ cmake ];

  buildInputs = [ fmt_8 ];

  doCheck = true;

  installPhase = ''
    mkdir -p $out/lib $dev/include/fmtlog
    cp libfmtlog-${if enableShared then "shared.so" else "static.a"} "$out/lib/"
    cp "$src/fmtlog.h" "$dev/include/fmtlog"

    cd $out/lib
    ln -s libfmtlog-${if enableShared then "shared.so" else "static.a"} libfmtlog.${if enableShared then "so" else "a"}
  '';

  meta = with lib; {
    description = "fmtlog is a performant fmtlib-style logging library with latency in nanoseconds.";
    homepage = "https://github.com/MengRao/fmtlog";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
