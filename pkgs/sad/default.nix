{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-07";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "87c7f478ec6cc6a84834f094c6785dd74710dea4";
    sha256 = "1f1ln2fmahpnbcnfj53fcr24wb27069xb9jw0hbqr8mqh600gi3h";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
