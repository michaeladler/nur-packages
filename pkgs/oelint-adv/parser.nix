{ lib, stdenv, fetchFromGitHub, python3Packages, ... }:

python3Packages.buildPythonPackage rec {
  pname = "oelint_parser";
  version = "2021-06-05";

  src = fetchFromGitHub {
    owner = "priv-kweihmann";
    repo = "oelint-parser";
    rev = "3811959428f5b8881ad968cd0c197f62ce1b5839";
    sha256 = "1ggixzm0ww2gj3m7hxa8cbn56pcbiwjcbgv1dnnyacm20nfxf23b";
  };

  meta = with lib; {
    homepage = "https://github.com/priv-kweihmann/oelint-parser";
    description = "alternative parser for bitbake recipes";
    license = licenses.bsd2;
  };
}
