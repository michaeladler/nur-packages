{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-11-27";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "29444af136cb7ea017a5d7176ea85fc04e9810a1";
    sha256 = "05ihk4arys69kbmzwjhmlrw9s48v13mb7jjyic8whfw65x9s2qkr";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
