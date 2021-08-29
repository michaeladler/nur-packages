{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-08-28";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "1607defeb7b316597548811a038bd8fc1e7642f1";
    sha256 = "0gwkvdny2rl98mwk813d0yl85lwmpmsjfzac0szzskr5nv7npn26";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
