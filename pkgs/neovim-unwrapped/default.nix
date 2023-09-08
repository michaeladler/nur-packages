final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-09-07";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "fe869a8ce25a14497a9bf5ddca0ae11a1c38a22c"; # tags/*
    sha256 = "0kl41d5scgjrgmlrm5y6i6nfkyjrqly0agkkg3n14fml5nk8naml";
    fetchSubmodules = true;
  };

  patches = [ ];

})
