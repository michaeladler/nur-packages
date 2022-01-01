{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-31";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "8c35dc5fd5172ac55ecc438dd6c1956c7c37cd3d";
    sha256 = "0sgvhj7ln6p9hfdjxbisndmg94m7yn3arr0flypwdhs941nbw910";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
