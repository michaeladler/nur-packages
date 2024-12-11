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
  version = "unstable-2024-12-10";

  src = fetchFromGitHub {
    owner = "sbabic";
    repo = "swugenerator";
    rev = "9ba3756a849fe8538a35dba2510791e8e76c7c44";
    sha256 = "0nxvgry9cdxlr65kn15hmnlal0m2nmh2ja3kwwz29yr36jd3i8kz";
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
