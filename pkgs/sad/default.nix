{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-08-27";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "f230d15fbeb295b97276f4b167c67da0fc471823";
    sha256 = "0lqw463pj7wvz4wfxhz5y6n1va1zn2cclvja4r8c016hd3l7qkdq";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
