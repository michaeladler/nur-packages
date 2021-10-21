{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-10-20";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "66a6531627c67c0117230affe67dc04a17d3b5a8";
    sha256 = "0ii30zyqifay88h02i05dli9amkvj71i93drd2r0fvzz7p9qh72x";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
