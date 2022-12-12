final: prev:

prev.git.overrideAttrs (old: rec {
  version = "2.38.2";

  src = final.fetchurl {
    url = "https://www.kernel.org/pub/software/scm/git/git-${version}.tar.xz";
    sha256 = "0r062zbrw8r9n2027wmcsq1slc1iif3lfw46mjqx8ryc8n11ynhi";
  };

})
