{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-10-02";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "11819cc3769fce31ee6b8e32ee2f753c3832f2c0";
    sha256 = "14r9l7rwad1pzkzghacfwhz0csyh3g2hyy2033dw479k62rnxvzk";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
