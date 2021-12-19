{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-18";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "9e73274303a78620cd6573e84e8828896734d27a";
    sha256 = "0cnm7wngcj47f79zcn49qagbbwdcslfccldam9j1a763znypfiil";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
