{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-10-09";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "2b0d0c07f75fb0a038591a9c83bf36a480b08854";
    sha256 = "1b89idb2a2ba2rq4dqqa21kbjj63k1kcv5761fg6v6njcxdzzps0";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
