{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-09";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "ac2c73916ba4d62ecc1d5f2a502be02d00a96779";
    sha256 = "1wdqcqivsz09jfn3s08qrmvrgiqi01vpfrn45gjw3xqa4avb6sa1";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
