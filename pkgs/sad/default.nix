{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-11-30";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "25863426c5a9f39e938c261b966ed4bdec5a9317";
    sha256 = "1i2l4zkshs3m0d7f91q6y64505i46xf0dbl087dniz09b51yc2x4";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
