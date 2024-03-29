{ stdenv, python3, debian-devscripts, lib }:

let
  buildPythonPackage = python3.pkgs.buildPythonPackage;
  fetchPypi = python3.pkgs.fetchPypi;
in

buildPythonPackage rec {
  pname = "gbp";
  version = "0.9.29";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-kmqYk7QaTZ94fSfTjlbzlJ+GJFKdxV4hVT7FZmZcOFI=";
  };

  propagatedBuildInputs = (with python3.pkgs; [ python-dateutil ]) ++ [ debian-devscripts ];

  doCheck = false;

  preBuild = ''
    export WITHOUT_NOSETESTS=true
  '';

  meta = with lib; {
    description = "Suite to help with Debian packages in Git repositories";
    homepage = https://honk.sigxcpu.org/piki/projects/git-buildpackage/;
    license = licenses.gpl2;
  };
}
