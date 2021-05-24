{ sources, lib, stdenv, fetchFromGitHub, python3Packages, ... }:

let
  metadata = sources.oelint-parser;
  buildPythonPackage = python3Packages;
  fetchPypi = python3Packages.fetchPypi;

in python3Packages.buildPythonPackage rec {
  pname = "oelint_parser";
  version = "HEAD";

  src = fetchFromGitHub (with metadata; { inherit owner repo rev sha256; });

  meta = with lib; {
    homepage = "https://github.com/priv-kweihmann/oelint-parser";
    description = metadata.description;
    license = licenses.bsd2;
    maintainers = "Michael Adler <therisen06@gmail.com";
  };
}
