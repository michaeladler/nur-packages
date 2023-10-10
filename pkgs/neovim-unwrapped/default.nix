final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-10-09";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "d772f697a281ce9c58bf933997b87c7f27428a60"; # tags/*
    sha256 = "0wj1p5x88s58f22crdyzwlfiqgnwlqdkbw4wxllf0v5hg16gbnhp";
    fetchSubmodules = true;
  };

  patches = [ ];

})
