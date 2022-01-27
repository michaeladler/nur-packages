{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2022-01-27";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "1280313c82cb2a57fbd1fed02e1c7b820d81098a";
    sha256 = "1a7hd9b8jjgcwdn60wk824sy0i584gm8c4mppipk2mgf29b1dgsj";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
