{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-15";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "a680dc468fd1fa52acd35058775f8ede56b3bbf0";
    sha256 = "17ms18asihpjfc5p9ac67xzcp0fwqn774367xv3rzmb17g3igiwv";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
