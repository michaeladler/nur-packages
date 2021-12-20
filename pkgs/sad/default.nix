{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-20";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "108d4448b866bfb1487a6a15d6ca715241109bc5";
    sha256 = "1kdbx0n8bl5f83czlrbyqabmlypmikcwfqzqz4qvaljz2rl6p1ic";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
