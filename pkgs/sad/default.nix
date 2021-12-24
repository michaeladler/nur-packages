{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-23";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "86c127c94ab24b415e46eac3ca37c73008b55de6";
    sha256 = "0kxkwbrd8f6nlm6l5h657v60jm6c7m7rhyzazkqg4xcvbxw4mbxy";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
