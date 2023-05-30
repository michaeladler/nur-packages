final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-05-29";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "7d4bba7aa7a4a3444919ea7a3804094c290395ef"; # tags/*
    sha256 = "18dsl9fjcqvcqffny6jmcxwx5a7d13aykn310hbgghny8l11rw3c";
    fetchSubmodules = true;
  };

  patches = [ ];

})
