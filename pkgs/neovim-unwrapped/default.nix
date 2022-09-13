final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-13";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "907fc8ac373226556b84c2fdc4fe26525bbdb2c4";
    sha256 = "1ppxs2qs41l7rn8hk7ka9npcfz3pk0k06xf762h0g173ify085kx";
    fetchSubmodules = true;
  };

})
