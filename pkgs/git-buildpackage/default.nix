{ src, stdenv, lib, fetchFromGitHub, python3, debian_devscripts }:

let
  buildPythonPackage = python3.pkgs.buildPythonPackage;
  fetchPypi = python3.pkgs.fetchPypi;

in buildPythonPackage rec {
  inherit src;

  pname = "git-buildpackage";
  version = toString src.lastModifiedDate;

  propagatedBuildInputs = (with python3.pkgs; [ dateutil ])
    ++ [ debian_devscripts ];

  doCheck = false;

  preBuild = ''
    export WITHOUT_NOSETESTS=true
  '';

  meta = with lib; {
    description = metadata.description;
    homepage = "https://honk.sigxcpu.org/piki/projects/git-buildpackage/";
    license = licenses.gpl2;
  };
}
