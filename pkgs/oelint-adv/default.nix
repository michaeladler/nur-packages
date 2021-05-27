{ src, stdenv, lib, callPackage, fetchFromGitHub, python3Packages, python3-oelint-parser }:

let
  buildPythonPackage = python3Packages;
  fetchPypi = python3Packages.fetchPypi;

in
python3Packages.buildPythonPackage rec {
  inherit src;

  pname = "oelint-adv";
  version = toString src.lastModifiedDate;

  propagatedBuildInputs = [ python3-oelint-parser ]
    ++ (with python3Packages; [ urllib3 anytree colorama ]);

  meta = with lib; {
    homepage = "https://github.com/priv-kweihmann/oelint-adv";
    description = metadata.description;
    license = licenses.bsd2;
    maintainers = "Michael Adler <therisen06@gmail.com";
  };
}
