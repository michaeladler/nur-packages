final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-02";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "cc1ceebf8f13aed1ec0cbe0ff1ad7b2d8a6f10be";
    sha256 = "0r93kgiqjby4m0ravrmjf94840rrwrgw29g2alir6w2npqmdf4rx";
    fetchSubmodules = true;
  };

})
