{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-17";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "f90f13a522e3f2e7b55bf799647f3552c71109c4";
    sha256 = "1whzrdql8wzi3ymnmgk5z0gm79v1s0h0m9mdl5w7lm8yhi50xqqw";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
