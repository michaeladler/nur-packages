{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2022-02-04";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "db94fc968590bc31f7337159c4f83f58109c12cf"; # tags/v*
    sha256 = "1f5k2y731h64m9pgki3dxh6pgb4wkq58rsi5kjcf8g4hg2li4686";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
