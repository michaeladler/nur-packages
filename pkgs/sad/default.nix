{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-11-16";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "d9a515dce44e3beaba52c8c6ea4a05798b47bf2a";
    sha256 = "0a353rqhnn9m5r4rhsvm5yca5xjb3f45qgg97c85hjhgywcr655b";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
