{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-08-23";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "dbd8214fb6acc010d1aef5fb764bf44c3a14fc0c";
    sha256 = "0lf65xbw7wy371p4383957i9yqpbqvpkj00n65qziwnbb3x2p6ai";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
