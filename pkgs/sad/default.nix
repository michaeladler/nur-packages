{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-17";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "759a96d49ed215d8fb4f37de42d39f32e047157c";
    sha256 = "1wjbbc72i8vcjswmxj2s2qyxiaqyiyqjc9y9bx5gsgkq3gjf7l2p";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
