final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-30";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "7f20d61e0036433a819cb89aa73baf81d4ff5d2c";
    sha256 = "0clczn0rqa754zmyxvn9390xxp7qx3n5r6h5s4rhi4d318k51dp2";
    fetchSubmodules = true;
  };

})
