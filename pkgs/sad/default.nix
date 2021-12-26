{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-25";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "6f52f265c92420f0030177627f7c1eab3c560e29";
    sha256 = "0cj0nwjdgksn872ymllg04zxxyk3rz9wff8flp81h7gx77xb1y30";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
