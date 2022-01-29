{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2022-01-29";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "7bfb754e12ec0a862babcc676b0b28bdf6cf3079";
    sha256 = "0fgh11bzfzimqdhw4mqp5cgh3gwzzkic5ppfdhwwycw6cs2c8pqf";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
