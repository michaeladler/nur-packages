final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-29";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "19a76366416acc7776d4a5e9d9b1d0492d2028e4";
    sha256 = "13p33akfnzwki1sq85cp8977fi6x0nfj8vwlk3852wi0794ag067";
    fetchSubmodules = true;
  };

})
