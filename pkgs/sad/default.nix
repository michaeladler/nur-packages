{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-11-14";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "d51197dbab14dd58a519b7c5879ebabc8fb549ad";
    sha256 = "11mk2xzmnfwqysjxiii51g6xaiqd9vcg8fm0v3nxsnnas6n2p87a";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
