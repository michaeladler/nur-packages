{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-10-25";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "b22148e7efde6e2cd4682b8e9d64b84dd1a174d8";
    sha256 = "1b30ygpw2h94a7xsav91fam7mhgm1vshyfrhfhagaab2g2y7cc6m";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
