final: prev:

prev.git.overrideAttrs (old: rec {
  version = "2.39.2";

  src = final.fetchurl {
    url = "https://www.kernel.org/pub/software/scm/git/git-${version}.tar.xz";
    sha256 = "1mpjvhyw8mv2q941xny4d0gw3mb6b4bqaqbh73jd8b1v6zqpaps7";
  };

})
