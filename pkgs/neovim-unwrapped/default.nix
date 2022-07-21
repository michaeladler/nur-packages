final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-07-21";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "1f1863ed54355c314a5016560809e65c3fb0cb79";
    sha256 = "0gmigpvhn9l68j29y6fgvn7dh0h6hm9wzglcz01m8l8a3261k5na";
    fetchSubmodules = true;
  };

})
