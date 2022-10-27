final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-27";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "c41873ab638589c1052404f5e5abef98a61db073";
    sha256 = "1mmnjxi3zmc1agdcc0xfpdqabzgh2pvplvlymckfq7kax6p5xmkn";
    fetchSubmodules = true;
  };

})
