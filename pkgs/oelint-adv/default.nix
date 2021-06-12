{ stdenv, lib, callPackage, fetchFromGitHub, python3Packages }:

let
  buildPythonPackage = python3Packages;
  fetchPypi = python3Packages.fetchPypi;

  oelint-parser = callPackage ./parser.nix { };

in
python3Packages.buildPythonPackage rec {
  pname = "oelint-adv";
  version = "2021-06-10";

  src = fetchFromGitHub {
    owner = "priv-kweihmann";
    repo = "oelint-adv";
    rev = "02a15e9406af5747e38537e69116e8797d3bb2bd";
    sha256 = "0byq8bc06cq9prghq2188rs6k72a4jz03gx74y6z9hskr8i2jvan";
  };

  propagatedBuildInputs = [ oelint-parser ]
    ++ (with python3Packages; [ urllib3 anytree colorama ]);

  meta = with lib; {
    homepage = "https://github.com/priv-kweihmann/oelint-adv";
    description = metadata.description;
    license = licenses.bsd2;
    maintainers = "Michael Adler <therisen06@gmail.com";
  };
}
