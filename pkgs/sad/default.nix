{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-24";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "56986106ccdf016f3ace3cfc45a3b770f6deffb5";
    sha256 = "1d47ay1x4bkdzybd41665lpfls36ssqqiv5vkrzjzz4yj43ajk7w";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
