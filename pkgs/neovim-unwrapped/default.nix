final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-07";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "e9c1cb71f8a4d6d7818dcb5f71ac78bee431309a";
    sha256 = "041hzmk7yv02m8ipb3kq8jqhh5r956miykrl632lknp9pr2psqh1";
    fetchSubmodules = true;
  };

})
