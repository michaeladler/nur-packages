{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-10-06";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "126ce3d009a62a2d76e05647b29a48e7d5daa4f9";
    sha256 = "0snm4b8vfdi2ghbsd2q9110wh9r99xn66xa3ch0qpwsi4n7nm6bm";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
