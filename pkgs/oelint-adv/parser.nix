{ lib, stdenv, fetchFromGitHub, python3Packages, ... }:

python3Packages.buildPythonPackage rec {
  pname = "oelint_parser";
  version = "unstable-2021-08-24";

  src = fetchFromGitHub {
    owner = "priv-kweihmann";
    repo = "oelint-parser";
    rev = "6a70945ed9acbfc4a5a28ea95b8ac0a92fa42abd";
    sha256 = "1hy08zrs0jn7b2ypn0bikr0h75i3zzxlr6lwza7pb9bf3zsvbvap";
  };

  meta = with lib; {
    homepage = "https://github.com/priv-kweihmann/oelint-parser";
    description = "alternative parser for bitbake recipes";
    license = licenses.bsd2;
  };
}
