final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-23";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "d70193c3260d2baa264b7a287bff352e32b33cc2";
    sha256 = "1snjkykvzfnmzj0rzwc3bln5r8gs2pj207gjil5gb82p39pd6svr";
    fetchSubmodules = true;
  };

})
