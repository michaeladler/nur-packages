{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-10-22";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "aaeb90f05ef572f2c1019d2d40a7bd75de6eab3e";
    sha256 = "0b1znhxsmv0pp2ldb0vcfwvrnkx825l4nqyb6ikvd77rpfpp5g3k";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
