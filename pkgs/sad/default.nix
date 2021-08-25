{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-08-24";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "40cb9c1aa47ad2b2d72fae8fc8d94e44f2d10157";
    sha256 = "15sfa2v3xlbq8m214d1rflv6c8fz7dzrcwqqf2s3brrc57ppkb93";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
