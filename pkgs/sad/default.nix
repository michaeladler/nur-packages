{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-22";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "e2b6cfd5bd2c777461eb564ddb95787e8f96a5da";
    sha256 = "084sp6gykvdvl08gvhjb26raaym7ib79snhnip0cbrzrr7f0fs5p";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
