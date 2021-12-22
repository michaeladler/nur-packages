{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-22";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "9407278d20d50c75770b3f7e720424b7ecf51f8d";
    sha256 = "0ywhqamn713nilg6a7kdm5rxq930nckrj8cy62b32lc26di6kgk4";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
