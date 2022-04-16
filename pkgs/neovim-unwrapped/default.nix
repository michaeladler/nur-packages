final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-04-15";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "333ba6569d833e22c0d291547d740d4bbfa3fdab"; # tags/*
    sha256 = "1m7xmry66pn27gvk7qj9di83xa1h7zjp4c6ygnf218pqhr08x06g";
    fetchSubmodules = true;
  };

})
