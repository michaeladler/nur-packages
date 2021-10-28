{ stdenv, lib, callPackage, fetchFromGitHub, python3Packages }:

let
  buildPythonPackage = python3Packages;
  fetchPypi = python3Packages.fetchPypi;

  oelint-parser = callPackage ./parser.nix { };

in
python3Packages.buildPythonPackage rec {
  pname = "oelint-adv";
  version = "unstable-2021-10-27";

  src = fetchFromGitHub {
    owner = "priv-kweihmann";
    repo = "oelint-adv";
    rev = "9b7a281cd180f44b3e77abc3c09e4af6d97c8fe2";
    sha256 = "04hv08jg13qzxbxk1ppg0z7lxbsmm67v8nxql24jiw1l820n6asd";
  };

  propagatedBuildInputs = [ oelint-parser ]
    ++ (with python3Packages; [ urllib3 anytree colorama ]);

  meta = with lib; {
    homepage = "https://github.com/priv-kweihmann/oelint-adv";
    description = "Linter for bitbake-recipes";
    license = licenses.bsd2;
  };
}
