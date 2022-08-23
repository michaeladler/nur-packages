final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-23";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "48a4657aee76e41d097b0730c91bcca78b5bc9c7";
    sha256 = "0xmcf00i1y4734ih9ba07nmhpyc3z7kvsd1ai9c2pb77z7kvva7r";
    fetchSubmodules = true;
  };

})
