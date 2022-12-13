final: prev:

prev.git.overrideAttrs (old: rec {
  version = "2.39.0";

  src = final.fetchurl {
    url = "https://www.kernel.org/pub/software/scm/git/git-${version}.tar.xz";
    sha256 = "0nr6d46z3zfxbr1psww7vylva3mw6vbhnywixhywm6aszc9rn6ds";
  };

})
