{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-26";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "f9e697ce2b5bf009f1f7c31dcb1b9fd7f74e4937";
    sha256 = "12g91i17rq0nz8f2fpi8a1vvp5rd4306l01wrgzn1bmcrpdg0zwz";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
