{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-10-25";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "e5fab0745f8c4644757333c07b65d692030268ff";
    sha256 = "0p8hqygd4z3f4aab05x7sarypjs3bxn4rq7w1kqcjbnhx4dsp04z";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
