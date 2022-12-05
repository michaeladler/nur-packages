final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-05";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "89374da798ff29e651c47ed4159aa89e3395af9f";
    sha256 = "1a7wfibbybsh2d237dp7qpj8iag0fkxxjsycgr81apiwyzhww5q9";
    fetchSubmodules = true;
  };

})
