{ src, lib, stdenv, fetchFromGitHub, python3Packages, ... }:

python3Packages.buildPythonPackage rec {
  inherit src;

  pname = "oelint_parser";
  version = toString src.lastModifiedDate;

  meta = with lib; {
    homepage = "https://github.com/priv-kweihmann/oelint-parser";
    description = metadata.description;
    license = licenses.bsd2;
    maintainers = "Michael Adler <therisen06@gmail.com";
  };
}
