{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-05";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "a7fcf9ce58e7b07c8f6df13973af9c3ce64aacbb";
    sha256 = "042jff6fp4b1sj3cdkrmwrdw0g39zhr5jg74w0qczhwv0pgqpbah";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
