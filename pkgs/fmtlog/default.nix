{ stdenv
, lib
, fetchFromGitHub
, cmake
, fmt_8
, enableShared ? !stdenv.hostPlatform.isStatic
}:

stdenv.mkDerivation {
  pname = "fmtlog";
  version = "unstable-2023-03-26";

  outputs = [ "out" "dev" ];

  src = fetchFromGitHub {
    owner = "MengRao";
    repo = "fmtlog";
    rev = "5aea0764c820358ec1a842cd34cb6d494f65cfa1";
    sha256 = "0640zc9c3zc7mfqfn3xcnman82m2kdxj66npz31n8ajaqwkqhzc1";
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
