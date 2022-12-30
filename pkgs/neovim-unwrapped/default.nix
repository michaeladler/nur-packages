final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-30";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "6a45360de99b1a7d0d3d9ca1060d5212717c7578";
    sha256 = "00151z4fbnacji99fxfc8hqgpsvdnixpsv4z6kczw6sdmdg5rivi";
    fetchSubmodules = true;
  };

})
