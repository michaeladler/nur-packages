{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-07";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "a2886ca109c299b9d734fb14bbf2995ff45a82f1";
    sha256 = "1j29279xzi0w3k4fp4ac50cxavqka4vag9na8mb8ir3vzn8701sd";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
