{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-10-27";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "c1b365c4546ca66455a24e3317b0a08a24cde986";
    sha256 = "0vg542n5hz89nnr28qx8hypcpz2plasqs2d002qg7srdwr01l1x8";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
