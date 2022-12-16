final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-16";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "37915cc5abd5c6f6ae89c1091304c8da2b0fa8fe";
    sha256 = "1nays5wlz6bwyk0gvv95yq2bbqw8jjqwq6syih23r087hc7yzqiv";
    fetchSubmodules = true;
  };

})
