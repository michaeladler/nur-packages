final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-20";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "45d1b1c6788a5694850361b5ffa95d63eb75b2f5";
    sha256 = "095qz4v1g2in9mz2cmndjsl8q54649c1lrhnm4ljcm6wwfbw27bz";
    fetchSubmodules = true;
  };

})
