{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-11-13";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "6e79adcd93f3c7034b1e6bd928945bc489b75da5";
    sha256 = "0sr251vq16vlz574a789k23m37201lads17rj7xk9x245jzilq14";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
