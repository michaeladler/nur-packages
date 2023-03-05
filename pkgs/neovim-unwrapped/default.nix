final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-03-05";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "b44b8e7687ece66f4c535182071223d78ca54ad0";
    sha256 = "0bbsr9j9fkdj18y0rkmmh9yl1s4r4d0s7fi3y3260jz9n39r394y";
    fetchSubmodules = true;
  };

})
