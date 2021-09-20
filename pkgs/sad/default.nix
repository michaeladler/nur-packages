{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-19";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "6640d7e61b8d76be1ec946828c702fe5d808fea0";
    sha256 = "00pahkr4rpl8x6nxgv2f3lqibvq7crbsdla9jkc09gmbb7kfgidj";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
