{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-08-22";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "8b60e6f3a164a74eddd69e2cb7590c8820118d48";
    sha256 = "183zldwdsvbd3ajvj9qbrkmn2jxrr102mdf456nv3mavbzlfa99f";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
