final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-29";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "98695b49992daa2b40eb3d5b5e4a86e99c92ed0e";
    sha256 = "16lz2xxxgwkfzm8bjz44h9ln78x8m9q7kfsj2d2wxlq37yz4ws2d";
    fetchSubmodules = true;
  };

})
