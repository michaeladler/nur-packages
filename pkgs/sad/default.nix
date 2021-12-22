{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-21";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "12d6741dfc57085a4e5b0fad22280c58062f25c6";
    sha256 = "0pc612axygqgd0q9knnmfkdvb10pxmnbq52nwmbsc3plllsma1hg";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
