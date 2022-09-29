final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-29";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "45707c1eae62667e5c482a09f6d9a62e01db0e21";
    sha256 = "1pvi7r7j50z4gd8sy75fwv531kpka76xmj679vamf0x0d9nldni0";
    fetchSubmodules = true;
  };

})
