{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-09";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "f2f1dea23e4542ac53e4a5ab99d5090bd00b0c27";
    sha256 = "09m9hf2bzhjwkww0439y9zikjq6qc6l28bqsjlisnw1lvbkk1g36";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
