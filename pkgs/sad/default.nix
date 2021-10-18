{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-10-17";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "89112fcdea7e67469d063b46bcaee93fae14b758";
    sha256 = "00h4bfp1iy31pgmrg17vbl5hyadwd2bh0kniyrzzamyq0ibj95ba";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
