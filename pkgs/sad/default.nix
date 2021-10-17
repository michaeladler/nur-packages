{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-10-16";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "d820093bcb7e2ec541f9a0a6005ca3cdae002ff3";
    sha256 = "15ksky0434wnpznccixhdysa2m80nllc6zssbaxc322z88s4037a";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
