{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-11-01";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "bd38f715ae7f0de630bd452a3f0e6ae2b6d2a475";
    sha256 = "0g5fdkra43nmmd5f0r5xngg5h9lxi5ijbyi12x43rrx979qraial";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
