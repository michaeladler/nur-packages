{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-10-12";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "88889912ef6c947343953878c60eb6f0f98fba01";
    sha256 = "1dm2v58a0i3vnpysnpljqa40llly4az3plnkv69pycc5dshk1f2j";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
