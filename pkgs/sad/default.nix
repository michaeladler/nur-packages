{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-03";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "392d66994c70972d490e3c349a9513f5ba48f137";
    sha256 = "0gp7kw8jyj5wnvjqhfz48xg7jbz5mfdf1lnazwarf4rn1kfn21m2";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
