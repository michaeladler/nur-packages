{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-11-29";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "fccf0e93a5fa1ea73e8b7e62841fa0e084380608";
    sha256 = "1cskn1jkcih2qbfdkj4z096mjcf97djs30lsym1nxpgfbfifclfx";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
