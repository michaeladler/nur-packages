final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2024-07-24";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "7e194f0d0c33a0a1b7ccfaf2baafdacf7f22fbb5"; # tags/*
    sha256 = "1xmncdj6nxa45m0qk3wmnp7b5d0iqqapy1m2vqzv316rr2snxrg4";
    fetchSubmodules = true;
  };

  patches = [ ];

})
