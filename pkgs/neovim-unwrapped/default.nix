final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-22";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "d41e93d5a83642f90898cae211e017d99ff97fd9";
    sha256 = "1m1q5bnqd0sbaap1m5b7asa4h08amkpns1fgfgfp3g56wn2hsnyk";
    fetchSubmodules = true;
  };

})
