{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-30";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "54ee11b160b139ba95980d4523a99c8a96e32f82";
    sha256 = "0w8lnf149pk1xnw5n72sszss9nga9fs2cyj0l9p7ml6xydnc16m2";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
