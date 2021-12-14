{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-14";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "2b32b3e38977514991c5324d6d35ba4d061e2fac";
    sha256 = "0q4j0dcwjzsqp0hal13zvdnzrwk0ra3r1bqcrysscy6prqk720ps";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
