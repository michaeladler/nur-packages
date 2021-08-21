{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-08-20";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "1b8f154413352fc2cb777a0bda0885a2367d3d99";
    sha256 = "0am707hi00256sdilzpb5rkqdyghbp2n791qlqf4w654hhs53lnv";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
