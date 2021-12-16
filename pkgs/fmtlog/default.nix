{ stdenv
, lib
, fetchFromGitHub
, cmake
, fmt_8
, enableShared ? !stdenv.hostPlatform.isStatic
}:

stdenv.mkDerivation {
  pname = "fmtlog";
  version = "unstable-2021-08-10";

  outputs = [ "out" "dev" ];

  src = fetchFromGitHub {
    owner = "MengRao";
    repo = "fmtlog";
    rev = "c2fd203f5e0db064d703e1fec785d73b497bc4f4"; # tags/v*
    sha256 = "043hadp3jvx0hcf6ml61nw70xwg2r53fvvyhnhjrq9iwin88spz5";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [ cmake ];

  buildInputs = [ fmt_8 ];

  doCheck = true;

  installPhase = ''
    mkdir -p $out/lib $dev/include/fmtlog
    cp libfmtlog-${if enableShared then "shared.so" else "static.a"} "$out/lib"
    cp "$src/fmtlog.h" "$dev/include/fmtlog"
  '';

  meta = with lib; {
    description = "fmtlog is a performant fmtlib-style logging library with latency in nanoseconds.";
    homepage = "https://github.com/MengRao/fmtlog";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
