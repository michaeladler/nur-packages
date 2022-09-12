{ stdenv
, lib
, fetchFromGitHub
, cmake
, fmt_8
, enableShared ? !stdenv.hostPlatform.isStatic
}:

stdenv.mkDerivation {
  pname = "fmtlog";
  version = "unstable-2022-09-11";

  outputs = [ "out" "dev" ];

  src = fetchFromGitHub {
    owner = "MengRao";
    repo = "fmtlog";
    rev = "dbb4bfe389b53c84a06fc9529ef57aa82afccb06";
    sha256 = "0skdzi1lcy5779w1bj3z8cy2cc5aqbhm8nhnr7jplf89m9v1xyj9";
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
