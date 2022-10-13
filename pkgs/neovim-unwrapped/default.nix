final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-13";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "34c7007c32cd78b5589d72701c6669a2c378dd17";
    sha256 = "1rxrshy1hmvwhzpx6649ik67q5898cg74b39ha09hfyi0w50ibq3";
    fetchSubmodules = true;
  };

})
