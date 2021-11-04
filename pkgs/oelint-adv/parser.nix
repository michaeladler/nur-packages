{ lib, stdenv, fetchFromGitHub, python3Packages, ... }:

python3Packages.buildPythonPackage rec {
  pname = "oelint_parser";
  version = "unstable-2021-11-03";

  src = fetchFromGitHub {
    owner = "priv-kweihmann";
    repo = "oelint-parser";
    rev = "65f0646896b6484482dffb7c1b8450215fbf45e8";
    sha256 = "0dslb32b0xpwz5hcybcil9xk1ml037sa76d843hkcs4r0y3vfj0a";
  };

  meta = with lib; {
    homepage = "https://github.com/priv-kweihmann/oelint-parser";
    description = "alternative parser for bitbake recipes";
    license = licenses.bsd2;
  };
}
