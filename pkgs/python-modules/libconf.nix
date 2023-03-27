{ lib, buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "libconf";
  version = "2.0.1";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-L5ByWJU7pgqVqC1WM3JrR8gfLVz42IAbCSV5AW11f0o=";
  };

  pythonImportsCheck = [
    "libconf"
  ];

  meta = with lib; {
    description = "Pure-Python libconfig file reader/writer with permissive licensing";
    homepage = "https://github.com/ChrisAichinger/python-libconf";
    license = licenses.mit;
    maintainers = with maintainers; [ michaeladler ];
  };
}
