final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-30";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "19dab2ead2dfc49c24e004fcdbbef6948b7bde94";
    sha256 = "1z771sg5c29kdj6ablrgrzn790b632nc3i97k6k538jpk03zmymb";
    fetchSubmodules = true;
  };

})
