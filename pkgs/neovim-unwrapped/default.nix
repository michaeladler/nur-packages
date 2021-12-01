final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2021-11-30";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "e65b724451ba5f65dfcaf8f8c16afdd508db7359"; # tags/*
    sha256 = "sha256-mVVZiDjAsAs4PgC8lHf0Ro1uKJ4OKonoPtF59eUd888=";
  };

})
