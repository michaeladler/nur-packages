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
  version = "unstable-2025-05-22";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "swugenerator";
    rev = "a965717dfd3b5069bc46dd996e886444b812c393";
    sha256 = "16bz2bav8d19db1ihli60fbadvb6hkm85nxv5r2zmj0d9i68v4w2";
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
