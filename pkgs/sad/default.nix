{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-08-19";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "6c81b9a0cdc133726ab1035fafe0d2d77cf0341d";
    sha256 = "0434l5gzi1jq7dr44axm83zvv69szsv41hhbh0a1n5w02fdmrgvi";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
