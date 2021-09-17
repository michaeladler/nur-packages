{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-16";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "f97e3036740d71b19798dce61b71614bea2b2318";
    sha256 = "0cc1ins51srkyhkhpj3b1dvxcmnj0f5s3dzww5zixy5h99rlyyk4";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
