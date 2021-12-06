{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-06";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "2ed393c1c6b88f661f0d91bd99ccf1a4e210e219";
    sha256 = "068xvbw1dbhpxg7204gpqcjsfvisbplvm388a6z345ai21z5fwry";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
