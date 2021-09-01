{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-08-31";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "1fc16c103868e6d7ba10e72806cd8a5f7c65b206";
    sha256 = "1i5j6lz8gfnlhkjwgcnxhaa178ah7qcgb9ah6745b1cn83hkjn6d";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
