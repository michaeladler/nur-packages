{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-11-15";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "6f4b1de11d8261d17c5a4c30ec42c76eeb4eb366";
    sha256 = "1f92f1fk8mlb5zwmn8mp37cqnhq7biclcx9zi6mrgbhpkx7w7b6j";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
