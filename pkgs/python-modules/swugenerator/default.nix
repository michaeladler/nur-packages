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
  version = "unstable-2023-02-27";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "swugenerator";
    rev = "c95d3d51457feba46893897a92735e7833fd3378";
    sha256 = "01wwc6nnv707xf6asvsfi9rdnpsrgfvid9a51k6c08nfajrjjxgi";
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

  patches = [
    ./0001-refactor-remove-setuptools-from-install_requires.patch
    ./0001-fix-zstd-compressed-images.patch
  ];

  makeWrapperArgs = [ "--prefix PATH : ${lib.makeBinPath [ openssl opensc gzip zstd ]}" ];

  meta = with lib; {
    description = "A host tool to generate SWU update package for SWUpdate";
    homepage = "https://github.com/sbabic/swugenerator";
    license = licenses.gpl3;
    maintainers = with maintainers; [ michaeladler ];
  };
}
