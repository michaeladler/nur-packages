{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-02";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "dc8d8135922dfb5ba232831e0e50f503b18fb3c7";
    sha256 = "053fzjgxvbjpg510n31x0cp25m3wqbs6yxhalf9hhb87w21i18mk";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
