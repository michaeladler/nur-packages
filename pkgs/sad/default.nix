{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-08-21";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "7323256e2ebec1712254b94b38c6f1fa2149a709";
    sha256 = "1an48aivxr3wawn4kpnsdpw9w4qfdr5ymhawbmc669l8gb1688sc";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
