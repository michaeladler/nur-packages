final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-14";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "bf6de51f55c1b812342c7d4e88c65a7cae7fe97f";
    sha256 = "0fn8kfvxnv3rwph7766v0d046qfg5d49bb4v47xycf4fq8xx1aj5";
    fetchSubmodules = true;
  };

})
