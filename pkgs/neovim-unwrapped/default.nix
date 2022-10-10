final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-10";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "a5597d1fc066a8512ce9434dbff70850dc7bd5a1";
    sha256 = "1mvz6a576gi9mi0q6bb16bswjr3n5iwjxbnpv0ybq0p991ghlxhi";
    fetchSubmodules = true;
  };

})
