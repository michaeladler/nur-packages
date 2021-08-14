{ lib, stdenv, fetchFromGitHub, python3Packages, ... }:

python3Packages.buildPythonPackage rec {
  pname = "oelint_parser";
  version = "unstable-2021-08-14";

  src = fetchFromGitHub {
    owner = "priv-kweihmann";
    repo = "oelint-parser";
    rev = "a85ebccd9a3503da3f8e09fc3085468fe4d3f144";
    sha256 = "0b27a802b1wvb2si5bjpjbk47gdipsjqwxmlkcxkqy4h34b695w9";
  };

  meta = with lib; {
    homepage = "https://github.com/priv-kweihmann/oelint-parser";
    description = "alternative parser for bitbake recipes";
    license = licenses.bsd2;
  };
}
