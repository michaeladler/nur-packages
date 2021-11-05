{ stdenv, lib, callPackage, fetchFromGitHub, python3Packages }:

let
  buildPythonPackage = python3Packages;
  fetchPypi = python3Packages.fetchPypi;

  oelint-parser = callPackage ./parser.nix { };

in
python3Packages.buildPythonPackage rec {
  pname = "oelint-adv";
  version = "unstable-2021-11-04";

  src = fetchFromGitHub {
    owner = "priv-kweihmann";
    repo = "oelint-adv";
    rev = "e03617b51c7ebdeb8ea245eb61da3e3e03195b37";
    sha256 = "0jab1c9xzz0gv02pfn5ilwfs8gb01yadr6i0snngj409spx0jhna";
  };

  propagatedBuildInputs = [ oelint-parser ]
    ++ (with python3Packages; [ urllib3 anytree colorama ]);

  meta = with lib; {
    homepage = "https://github.com/priv-kweihmann/oelint-adv";
    description = "Linter for bitbake-recipes";
    license = licenses.bsd2;
  };
}
