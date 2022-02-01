{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2022-01-31";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "38b9395be487a4f47ec0fc7ecff66fcd56054dd5";
    sha256 = "0r5pz95xdpaaf4d1xn1mgk0rn2f4nr2v280pzhff5rs60s1hixpr";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
