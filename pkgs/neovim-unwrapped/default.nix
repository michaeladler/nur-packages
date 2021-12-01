final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2021-11-30";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "e65b724451ba5f65dfcaf8f8c16afdd508db7359"; # tags/*
    sha256 = "1iyyj07gz6997h7ndzqgnf0hjid23d48i11a83f8ynms5jh9jymi";
    fetchSubmodules = true;
  };

})
