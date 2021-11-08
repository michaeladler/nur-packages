{ stdenv, lib, callPackage, fetchFromGitHub, python3Packages }:

let
  buildPythonPackage = python3Packages;
  fetchPypi = python3Packages.fetchPypi;

  oelint-parser = callPackage ./parser.nix { };

in
python3Packages.buildPythonPackage rec {
  pname = "oelint-adv";
  version = "unstable-2021-11-07";

  src = fetchFromGitHub {
    owner = "priv-kweihmann";
    repo = "oelint-adv";
    rev = "255169e03b02656da4f71ec931233819ec705510";
    sha256 = "0x56jzq24f9nrp2wnivn3px9qkzwiczdr87mb8v8d5955xqwy3xm";
  };

  propagatedBuildInputs = [ oelint-parser ]
    ++ (with python3Packages; [ urllib3 anytree colorama ]);

  checkInputs = with python3Packages; [ pytest ];

  meta = with lib; {
    homepage = "https://github.com/priv-kweihmann/oelint-adv";
    description = "Linter for bitbake-recipes";
    license = licenses.bsd2;
  };
}
