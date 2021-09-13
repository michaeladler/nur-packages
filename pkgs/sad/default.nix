{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-12";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "cb55116ce35529378db1f1056a7095305c85e6d8";
    sha256 = "0x0lhv872cmrwixlq5qpg0n5fhk14pj9xa2a0v53b01kwy3rrccq";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
