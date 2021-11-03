{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-11-03";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "e22806f931ceb72f29295cc8fca573f86c8454a8";
    sha256 = "0r24jgws9vkkdmh7mn2l2mjafxivi2qn7g2bbw4vdgh026c7pkyj";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
