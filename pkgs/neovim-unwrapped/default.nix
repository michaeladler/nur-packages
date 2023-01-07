final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-01-07";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "1c6be5e5e67407d56001826999351806ae655fe5";
    sha256 = "0wyg5pcq1ps6cg8k0ffl1hwl5cyk1g29ivz83bis7mx6jq68dd5m";
    fetchSubmodules = true;
  };

})
