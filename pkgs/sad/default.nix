{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-11-10";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "4b2a9efc310ba5dfe8f8ef1be8f82a8623401e61";
    sha256 = "0dljs6cyjxy8afv6ms9v65w7mb17zkb41dds3j6r35zabiy0vvdd";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
