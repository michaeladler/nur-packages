{ stdenv, lib, callPackage, fetchFromGitHub, python3Packages }:

let
  buildPythonPackage = python3Packages;
  fetchPypi = python3Packages.fetchPypi;

  oelint-parser = callPackage ./parser.nix { };

in
python3Packages.buildPythonPackage rec {
  pname = "oelint-adv";
  version = "unstable-2021-12-14";

  src = fetchFromGitHub {
    owner = "priv-kweihmann";
    repo = "oelint-adv";
    rev = "5e4d1bc0ff5bd3b7f899cbf86988fff3599ab9a8";
    sha256 = "1r4kjnymjxrakrvkx2xm46ddrp5ccplcsqkpmpmcqspfma6pmva3";
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
