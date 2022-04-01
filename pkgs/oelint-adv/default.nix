{ stdenv, lib, callPackage, fetchFromGitHub, python3Packages }:

let
  buildPythonPackage = python3Packages;
  fetchPypi = python3Packages.fetchPypi;

  oelint-parser = callPackage ./parser.nix { };

in
python3Packages.buildPythonPackage rec {
  pname = "oelint-adv";
  version = "unstable-2022-03-31";

  src = fetchFromGitHub {
    owner = "priv-kweihmann";
    repo = "oelint-adv";
    rev = "2f1899618332cfb10f77132279cfe70f32f4b627";
    sha256 = "0r0iw9sr9bb5fmq62aipixzayx850sb6wgjgq39j4wmfb6s74drn";
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
