final: prev:

prev.git.overrideAttrs (old: rec {
  version = "2.38.0";

  src = final.fetchurl {
    url = "https://www.kernel.org/pub/software/scm/git/git-${version}.tar.xz";
    sha256 = "02ij201lyipv1w2zkcq4ng2bga2xkw58xnkbs1wdw50qdgiasglj";
  };

})
