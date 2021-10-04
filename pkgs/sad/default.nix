{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-10-03";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "b379527965009efe4972990b1ddb55c9f07c3a32";
    sha256 = "021iiqz6vs8jxw6rsmrrw9r8267xp2l7w6hvfib4kmgapbkx78zh";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
