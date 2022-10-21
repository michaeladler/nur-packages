final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-21";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "a288b4f21423efb056061e4da3871a4247a7de79";
    sha256 = "0pc5ghr0zda80az8ccx0d32zrk7y03n6h8jdl0xngq8m18gr50r4";
    fetchSubmodules = true;
  };

})
