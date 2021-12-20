{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-19";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "4dbec559e70ba9fc47bffa2d0d0d0fbb9df6c40c";
    sha256 = "0m4rwlyzzh25j5w4rrgzwpn61fh2pxk23879r4wm4l65kn07d88b";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
