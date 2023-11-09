{ stdenv
, lib
, fetchFromGitHub
, cmake
, fmt_8
, enableShared ? !stdenv.hostPlatform.isStatic
}:

stdenv.mkDerivation {
  pname = "fmtlog";
  version = "unstable-2023-11-08";

  outputs = [ "out" "dev" ];

  src = fetchFromGitHub {
    owner = "MengRao";
    repo = "fmtlog";
    rev = "01b6cd339101f36c37e50938ec11918c6229b2de";
    sha256 = "042dlpk3swnizdnk92wfwr5y9cd4gj4qn18ll96064xhmf8mn9jl";
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
