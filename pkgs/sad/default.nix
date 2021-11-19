{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-11-19";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "b09c748249a0ec463a2abe5ebebc3101b6cc9204";
    sha256 = "017vjd5g7s535ln92ibksgkgymrpn1ywz4snm4zhzddz80i3y2s1";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
