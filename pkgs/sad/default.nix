{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-11-20";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "b7a72801f244b1c597ad0bed67982b799bfc4e17";
    sha256 = "0mnx8a6x452xv2m1700nflxvk4334n63mcja2qal4pp7s4f1f48j";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
