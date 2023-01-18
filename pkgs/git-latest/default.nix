final: prev:

prev.git.overrideAttrs (old: rec {
  version = "2.39.1";

  src = final.fetchurl {
    url = "https://www.kernel.org/pub/software/scm/git/git-${version}.tar.xz";
    sha256 = "0qf1wly7zagg23svpv533va5v213y7y3lfw76ldkf35k8w48m8s0";
  };

})
