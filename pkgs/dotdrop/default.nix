{ stdenv, lib, callPackage, fetchFromGitHub, python3Packages }:

let
  buildPythonPackage = python3Packages;
  fetchPypi = python3Packages.fetchPypi;
in
python3Packages.buildPythonPackage rec {
  pname = "dotdrop";
  version = "unstable-2021-11-18";

  src = fetchFromGitHub {
    owner = "deadc0de6";
    repo = "dotdrop";
    rev = "24b43522a4f7f4294d2b5e3df18586c81476a984";
    sha256 = "1z1sarj7x22n9lfjcwmdnp0m6jl6bkgfmz4dqkv9cfj8fsansb9z";
  };

  propagatedBuildInputs = with python3Packages;
    [
      jinja2
      docopt
      ruamel-yaml
      python_magic
      packaging
      requests
    ];

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/deadc0de6/dotdrop";
    description = "";
    license = licenses.gpl3Plus;
  };
}
