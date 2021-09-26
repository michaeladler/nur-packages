{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-25";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "6fee6a56fcb3224718d5ea6438bee6a2e5801bc7";
    sha256 = "15l9qcdcq0rfphbbqnhwvwflq7j7kfiqyx18z52yjbzca152hgir";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
