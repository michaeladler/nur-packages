{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-11-26";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "c80e6b82a69a023bb2e8e8cb369c69536974d91e";
    sha256 = "0lj8gskihvr9yi5ymsy3bm1wxilrkkp794y2f8y6gvakm2c2cc94";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
