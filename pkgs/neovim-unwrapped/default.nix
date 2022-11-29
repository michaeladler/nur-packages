final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-28";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "80b6edabe3e4203ee4bf50261af07a6a0495ef36";
    sha256 = "0wiis3hdk5mkjr7zhbmnnsb007yrr06pvxxk678ym7cvqa5zvi12";
    fetchSubmodules = true;
  };

})
