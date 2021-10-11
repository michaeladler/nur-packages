{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-10-10";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "f71369e2e648267f8ade7d3b550c276fffc96f1b";
    sha256 = "1zymqxw0bjf581h9c9ca1dql9vrimpc3mq1bmmz1n3wl81nnpll4";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
