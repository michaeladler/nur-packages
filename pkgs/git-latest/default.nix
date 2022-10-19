final: prev:

prev.git.overrideAttrs (old: rec {
  version = "2.38.1";

  src = final.fetchurl {
    url = "https://www.kernel.org/pub/software/scm/git/git-${version}.tar.xz";
    sha256 = "1n8afjjim30lddhm25cdscdr2xfa518293jhqbxy1fd2b3mgipcp";
  };

})
