{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-10-18";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "8966ccbb95b886d037c6d0d7820f831b74e69383";
    sha256 = "199i7wvg0xpa19f1cnzfqic7zjvvqrwldykal4gzdda2rba5hgbb";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
