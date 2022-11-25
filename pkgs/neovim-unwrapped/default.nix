final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-24";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "2b55d09314500c0049427cd51e873cc4eac223b2";
    sha256 = "026ryhr8bpp0171airj6q3115lmnnw8ywgh6dc2naj2rm0lz0902";
    fetchSubmodules = true;
  };

})
