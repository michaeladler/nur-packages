{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-11-25";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "5e6e047ee7a4f135d5fd2f098b12d8133937c6e9";
    sha256 = "0d69w2qcgfh15wza437ifidyd74nmqi2b9g122kcn9ggbck8bkww";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
