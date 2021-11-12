{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-11-12";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "9147f559b350b7ca1c26fe3d6309685e7b929444";
    sha256 = "00lcpfhzrvdz8d2qaml13w4jl6avaj6mavrh94dbh5v6j0sf869x";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
