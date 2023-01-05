final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-01-05";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "ae64772a88125153a438a0e9e43d5f6bcb4eeb28";
    sha256 = "145nn4lyhkj5khr05ybx161wls61phyzcw0q1sa6isf94dn5v8g8";
    fetchSubmodules = true;
  };

})
