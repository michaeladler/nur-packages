{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-01";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "f0e2cb99cca4abc77075c563ba125c98854708ac";
    sha256 = "0qxdrip0y4qcxj8gi4vw7fs8lp1gq4pwa4g59ggdqg42fcsj5fm2";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
