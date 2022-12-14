{ stdenv
, lib
, fetchFromGitHub
, cmake
, fmt_8
, enableShared ? !stdenv.hostPlatform.isStatic
}:

stdenv.mkDerivation {
  pname = "fmtlog";
  version = "unstable-2022-12-14";

  outputs = [ "out" "dev" ];

  src = fetchFromGitHub {
    owner = "MengRao";
    repo = "fmtlog";
    rev = "cab8ad3e249c6b6ff900e1ca2730219bcdc9d949";
    sha256 = "0jx08pqppgjqnx4ncjd2kzr93iz1y02pjyysrk87mkd7c69xrm1r";
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
