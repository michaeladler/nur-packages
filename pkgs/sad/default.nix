{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-10-07";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "91759505d83b0fc19d51acc08013b87a1fcc7f57";
    sha256 = "08y1kn5crp7lk40gky2ypb2rlfmsajg5sfiaikjlrykv9qr3l5aj";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
