final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-04-07";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "040f1459849ab05b04f6bb1e77b3def16b4c2f2b"; # tags/*
    sha256 = "0xsvhm191cy5ivcw0c8dnpzbpcvvn5hsnkzkipr2aabgrsgqj628";
    fetchSubmodules = true;
  };

  patches = [ ];

})
