{ sources, stdenv, lib, callPackage, fetchFromGitHub, python3Packages }:

let
  metadata = sources.oelint-adv;
  buildPythonPackage = python3Packages;
  fetchPypi = python3Packages.fetchPypi;
  python3-oelint-parser = callPackage ./oelint-parser.nix { inherit sources; };

in python3Packages.buildPythonPackage rec {
  name = "oelint-adv-${version}";
  version = "HEAD";

  propagatedBuildInputs = [ python3-oelint-parser ]
    ++ (with python3Packages; [ urllib3 anytree colorama ]);

  src = fetchFromGitHub (with metadata; { inherit owner repo rev sha256; });

  meta = with lib; {
    homepage = "https://github.com/priv-kweihmann/oelint-adv";
    description = metadata.description;
    license = licenses.bsd2;
    maintainers = "Michael Adler <therisen06@gmail.com";
  };
}
