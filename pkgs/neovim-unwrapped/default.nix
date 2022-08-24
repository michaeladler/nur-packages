final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-24";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "64d147b4719310093ca2d728ba68b23f7e0660df";
    sha256 = "1ckc8x7lbsz7wxav3zdkrbyf6c509p7hwf26jxkj7kidas8lzdsc";
    fetchSubmodules = true;
  };

})
