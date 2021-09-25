{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-24";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "a8c3edf17b8339e2c9ac0cae249981ec2491bccf";
    sha256 = "18y20zpk5q2ivyhi1vrdavprvf2653sgzz6izjk3bwx3lxsz7ygc";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
