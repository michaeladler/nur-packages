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
  version = "unstable-2024-11-18";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "swugenerator";
    rev = "31bb6d74b6511e504bec95d3288e19ef46d8a0d9";
    sha256 = "12iyd2qs6k7br68k6lcvrxzah4xm58l9gmdgxhk5z7jfzjikjj36";
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
