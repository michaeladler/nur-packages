final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-03-12";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "714f6bf249fc6a9e6e389fafebdab3719bc06e71";
    sha256 = "1m7gbpc85kfjjc351xr7pszijffi599xwwf5nq5p7k5mlhi89fxl";
    fetchSubmodules = true;
  };

})
