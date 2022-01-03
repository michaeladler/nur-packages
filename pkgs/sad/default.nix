{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2022-01-02";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "01b3cbbecc42413759e1c7518cc9b6aec5d99800";
    sha256 = "15ihsgxjc3pnwm59gbr64hqdfha6haa6181d6j8yp4dnd6p346r9";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
