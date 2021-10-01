{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-30";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "767912123f3801e3a5d18b1668caf8596ac1ea9d";
    sha256 = "1q15v6ign96iwg4q6g6r01zsrcmagcg4cngqfddb153w5a53n3d4";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
