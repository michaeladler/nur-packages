{ lib, stdenv, fetchFromGitHub, python3Packages, ... }:

python3Packages.buildPythonPackage rec {
  pname = "oelint_parser";
  version = "unstable-2021-11-04";

  src = fetchFromGitHub {
    owner = "priv-kweihmann";
    repo = "oelint-parser";
    rev = "df3fb91bc21f7282612576f4d171fdb541f92ece";
    sha256 = "1vm3w4jvmfl0y852yhsk4145zpw05qzgb2mh6xwd95zasvfzzm1s";
  };

  meta = with lib; {
    homepage = "https://github.com/priv-kweihmann/oelint-parser";
    description = "alternative parser for bitbake recipes";
    license = licenses.bsd2;
  };
}
