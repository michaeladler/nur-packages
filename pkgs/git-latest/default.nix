final: prev:

prev.git.overrideAttrs (old: rec {
  version = "2.38.0";

  src = final.fetchurl {
    url = "https://www.kernel.org/pub/software/scm/git/git-${version}.tar.xz";
    sha256 = "sha256-kj6t4msYFN540GvajgqfXai3xLMEs/kFD/tGTwMQMgo=";
  };

})
