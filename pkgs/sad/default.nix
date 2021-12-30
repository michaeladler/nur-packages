{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-29";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "4dbf7707a138bc09277b4ff30bb7fad70f3e0b4a";
    sha256 = "1wsjr3clmhzway181g0cc9vwmzy7ydhfgl6gvhwx2c8n2ak276xp";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
