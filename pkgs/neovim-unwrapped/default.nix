final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-01";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "d8dbf58b4372d1415e3ca69541fc6fe71890ba53";
    sha256 = "0sq97hh0iycwa7qh6sx2bbi3mnlb9h9z5fik10x7lwqrg3sm6x56";
    fetchSubmodules = true;
  };

})
