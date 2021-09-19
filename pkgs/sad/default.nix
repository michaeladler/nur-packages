{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-18";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "577488dc71afdd6c67928a832eabb122abd18820";
    sha256 = "0a7v7sr8jzd3icvpnmgb0wisws1is3jkisz5xgnfijs8mb5sipa6";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
