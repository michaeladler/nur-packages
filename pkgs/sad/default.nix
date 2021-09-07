{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-06";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "fa66327fd3f7694ab284576acf94a794d6a612b0";
    sha256 = "05x3h83lcl9941mciy207dv6p1zr6rv2gsm1q64cnl9cyrhhsd65";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
