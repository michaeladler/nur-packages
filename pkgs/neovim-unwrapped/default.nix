final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-24";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "ddea80ebd66617bfc3a1af0b08d55dd7ed51f2ca";
    sha256 = "0dcd3czv3xxdsbqbf9yrm1sddvzdyri28di2p2qzngfggaiczgc7";
    fetchSubmodules = true;
  };

})
