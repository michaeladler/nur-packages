{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-10";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "c04dee9f002806763b5caadc25318935af492755";
    sha256 = "07mf2b56gpf164fb5drnibsbdxi0ydwjvwfvc2xq13lhrihhcip7";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
