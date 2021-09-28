{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-27";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "b0ef46b38a71ead9fd109817d200ed266badb049";
    sha256 = "16m5281hi597hys2frrkz37mqf23xnnjfs30lp29bf8xbcq6sip4";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
