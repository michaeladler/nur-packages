{ lib, buildPythonPackage, fetchPypi, libarchive }:

buildPythonPackage rec {
  pname = "python-libarchive";
  version = "4.2.1";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-lmxAcj3LLqSjiymw1LEwrQlhuRQjFFKO3X/O/0TorT8=";
  };

  buildInputs = [
    libarchive
  ];

  pythonImportsCheck = [
    "libarchive"
  ];

  meta = with lib; {
    description = "Libarchive wrapper for Python.";
    homepage = "https://github.com/smartfile/python-libarchive";
    license = licenses.bsd3;
    maintainers = with maintainers; [ michaeladler ];
  };
}
