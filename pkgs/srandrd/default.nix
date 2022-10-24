final: prev:

prev.srandrd.overrideAttrs (old: {
  version = "unstable-2021-10-25";

  src = prev.fetchFromGitHub {
    owner = "jceb";
    repo = "srandrd";
    rev = "bb00996f2f487bc1a24309d6475a384c4f383850";
    sha256 = "1yiyxyjc2lkpc4rw41l8a7zh7df9knwspwgafdl39r1rd94kvc7m";
  };

  patches = [
    ./debounce.patch
  ];

})
