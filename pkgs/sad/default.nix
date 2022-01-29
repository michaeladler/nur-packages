{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2022-01-28";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "5a764eb4537060b3ec9fc4e8ea2ae565f2548630";
    sha256 = "1660c25vi8671asvzynsjw4w9q0c2wv6bywrknimzn8qf8ms4bxh";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
