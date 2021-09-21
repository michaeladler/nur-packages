{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-20";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "9254ad042de45ba3c7cbfa8d4ddee7cd02d2a5ab";
    sha256 = "1xz05gbm2bxpy6q91sqrmyf8fv6kr2fkyl7ydh23h2p05zb0qynx";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
