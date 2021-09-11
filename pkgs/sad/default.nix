{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-10";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "58f653846ecd02c506a6e5a8e6b4b44034d15ce3";
    sha256 = "12h32haf7361snsbs92cbii53j76fdl9bq2gafqjqfx9h54khd6g";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
