{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2022-02-04";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "03c6761e94e392b1c3d8a36eedc9289c0bc4226a"; # pin
    sha256 = "1kdiqlkpqw1ap1j8ckv1wqxqw3wdq84mkyj694slxnbn7x21ccwy";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
