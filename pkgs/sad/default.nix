{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-11-17";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "4b5bfe8c093c6697d2a2ff96c42f52e9ee5cf476";
    sha256 = "1dzzbjxvkd0lwca7c5w5rs7yc596m57qnzssjn0vd40l7xpqw44k";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
