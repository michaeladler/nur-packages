{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-08-30";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "033a7e0e7c9bbf6ed821607958349977a77b5956";
    sha256 = "1hj1zr3n1251a38n5yjn08lnyvz2l3gwjcxdpxiaq2is0qbhqcl1";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
