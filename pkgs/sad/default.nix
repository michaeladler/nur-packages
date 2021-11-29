{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-11-28";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "aa3f05558e9dece7dbd51f8c7c6e3da5f9d10e1a";
    sha256 = "0vwva0ajl17mdwv22qvdg6df4f68835f2bln3gbnck7xz920zg3c";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
