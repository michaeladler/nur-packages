final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-26";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "c12f6002a15b27ada972b997bc0950f37d06027d";
    sha256 = "0ckc7ryjcjf6px3vx97wn9zikk1xd3wfbk5f04nwnz8m7wrbbddc";
    fetchSubmodules = true;
  };

})
