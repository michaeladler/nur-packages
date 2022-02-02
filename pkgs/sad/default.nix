{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2022-02-01";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "ce742b53601268584d61dbd3dc9b725334412282";
    sha256 = "11sjncz37g3pwxd0gjg2yrznggqp318h0843ig8bpzq8b7iv6f65";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
