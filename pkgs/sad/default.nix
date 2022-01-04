{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2022-01-03";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "a65b04ba8d5356676586adf10c363fc3de2fcc46";
    sha256 = "0vr7vznam6wm3s0n19la90lygf3nf4dwmv08dadcxs9ij3ksdg46";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
