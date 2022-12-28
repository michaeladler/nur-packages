final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-28";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "a731a40f78a407387fd60589e39bda960bdf5f1b";
    sha256 = "17480hsxrygqzznrn8cdmfjy59nyi8izr6pc97hv9zacnhqdb3r5";
    fetchSubmodules = true;
  };

})
