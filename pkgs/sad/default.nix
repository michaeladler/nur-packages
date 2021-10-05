{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-10-05";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "a9116b78b9da6afe024477d2ef7df4864484b8d1";
    sha256 = "040ihsh0bsdnzh1i7vifbybbyygwx8jbdnwyfjaklcadnqz6h42z";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
