final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-26";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "c00844aee4d9b607073ff123dfe2e872c9b84954";
    sha256 = "0myci8g6yk7vl72ymaw67zc6ya7q7kay24ji10qk2357hwqzlr98";
    fetchSubmodules = true;
  };

})
