final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-19";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "bcd25b2009f1e503e13c9fbdf9de9fa9aac0dca2";
    sha256 = "1ngdlqhq7f7zqscafksr9n54c58dxn49cplkncwhmxn7fasaik1p";
    fetchSubmodules = true;
  };

})
