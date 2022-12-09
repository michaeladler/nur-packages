final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-09";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "b5edea6553b4c1b5dd3530061d907848d7272d8c";
    sha256 = "17229gxhs0rdi03k1j7g2pivdx0nvih4av5xk0w11xvv4dfz9vck";
    fetchSubmodules = true;
  };

})
