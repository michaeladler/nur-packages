{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
  pytestCheckHook,
  libconf,
  python-libarchive,
  openssl,
  opensc,
  gzip,
  zstd,
}:

buildPythonPackage {
  pname = "swugenerator";
  version = "unstable-2026-03-08";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "swugenerator";
    rev = "6b93019cd92bcb6887083c0196766504eefbd2b0";
    sha256 = "014vzx59w8d3iq0rjp6d41y9n47gk0pqimb9jdnyzjw588da57a3";
  };

  build-system = [ setuptools ];

  propagatedBuildInputs = [ libconf ];

  doCheck = true;

  nativeCheckInputs = [
    pytestCheckHook
    openssl
  ];

  checkInputs = [
    python-libarchive
  ];

  # Integration tests compare the produced SWU bytewise against a checked-in
  # reference, which breaks with newer openssl versions. Keep unit tests.
  disabledTestPaths = [ "tests/test_integration.py" ];

  pythonImportsCheck = [
    "swugenerator"
  ];

  makeWrapperArgs = [
    "--prefix PATH : ${
      lib.makeBinPath [
        openssl
        opensc
        gzip
        zstd
      ]
    }"
  ];

  meta = with lib; {
    description = "A host tool to generate SWU update package for SWUpdate";
    homepage = "https://github.com/sbabic/swugenerator";
    license = licenses.gpl3;
    maintainers = with maintainers; [ michaeladler ];
  };
}
