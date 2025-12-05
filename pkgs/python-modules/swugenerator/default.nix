{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
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
  version = "unstable-2025-12-04";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "swugenerator";
    rev = "b43f81477ce16745ddcdcff9b16144a94e49ffcc";
    sha256 = "1bambld5m2xjmmjpsqn20v1m2fq9qaix8b5ssnvlwb62fk5ss27i";
  };

  propagatedBuildInputs = [ libconf ];

  doCheck = true;

  nativeCheckInputs = [
    pytestCheckHook
    openssl
  ];

  checkInputs = [
    python-libarchive
  ];

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
