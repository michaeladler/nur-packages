{ lib
, fetchFromGitHub
, buildPythonPackage
, pytestCheckHook
, libconf
, python-libarchive
, openssl
, opensc
, gzip
, zstd
}:

buildPythonPackage {
  pname = "swugenerator";
  version = "unstable-2025-11-11";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "swugenerator";
    rev = "d3ea98646d1056ae2a5269601129e4236ce143c4";
    sha256 = "1b2bryv57jxlnjr834b2lpzl0fn6klx9mcwa7f5lc5gdi3pkbby7";
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

  makeWrapperArgs = [ "--prefix PATH : ${lib.makeBinPath [ openssl opensc gzip zstd ]}" ];

  meta = with lib; {
    description = "A host tool to generate SWU update package for SWUpdate";
    homepage = "https://github.com/sbabic/swugenerator";
    license = licenses.gpl3;
    maintainers = with maintainers; [ michaeladler ];
  };
}
