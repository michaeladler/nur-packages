{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-28";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "561c9ddc9d04f490928ba0fc29374b053e9e5f3c";
    sha256 = "12r4n85cipjhipjdv0pqjnl41aqdmdkafhz3wsawhzqsb69i1rvn";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
