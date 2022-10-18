final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-17";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "be43cf16cc677cf50f31cbbf75bc028ce36b8921";
    sha256 = "1kk04xndiz91fnxpxdhkc371vvb524ca9kanz6y5i7w4vih4gvj8";
    fetchSubmodules = true;
  };

})
