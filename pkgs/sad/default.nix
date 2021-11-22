{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-11-21";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "5078777801f8fe6a57a96b9884c853a0c92ab5ac";
    sha256 = "1j522w1nbp0dfw9f8n6ldsrxkxhw8zmd1dhffizlmqn8hkkbj3mp";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
