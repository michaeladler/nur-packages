final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-07-29";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "02efdb4d587242122df99b347a25fd4c96b0ca97";
    sha256 = "0z81g7j5insfy3w9ymipvds1rdsl7azccl6rhpgjmc5n85gfh59d";
    fetchSubmodules = true;
  };

})
