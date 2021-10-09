{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-10-08";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "d8f89762f6c9e96a4cb1eae47c1d0673b01d6064";
    sha256 = "0r9cn6ymcrl6l93gig5npc70p32bla8wjkqgyczcybhaag4rmfi2";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
