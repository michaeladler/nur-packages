final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-14";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "0887ad1cbb050d2bc6169ad46aa07cf42c90493f";
    sha256 = "08d3js27q80gm141am9fyfkjx1c7i7ldpcdz24mlvxz3nf0h51yl";
    fetchSubmodules = true;
  };

})
