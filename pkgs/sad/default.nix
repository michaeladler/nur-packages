{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-11-24";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "1f5d343fd3aa7677536dcd7d3beb4fcbf2503d7c";
    sha256 = "1wqx8m6z97yxcf139jw3zh0gc3736zb4wla2dq0i50v2j1jaf1yk";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
