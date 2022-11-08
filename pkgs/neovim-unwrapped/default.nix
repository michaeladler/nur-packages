final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-08";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "d187c00faf4feb76bdc544b87bea71f217d05957";
    sha256 = "18cih7jpxh31xq9f55mb1iq5ls3nb1psz3dw3zvph97psw7ydd9w";
    fetchSubmodules = true;
  };

})
