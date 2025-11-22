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
  version = "unstable-2025-11-21";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "swugenerator";
    rev = "db49c8b1f369356a12ea7eae907e3ed05907309e";
    sha256 = "17jlc0v2cyr6im0a3srcb1d92mil1cwhlfc9hl9c3zxzayhljgsh";
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
