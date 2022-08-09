final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-08";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "e6680ea7c3912d38f2ef967e053be741624633ad";
    sha256 = "1kk9x6zyrl52x1dgj9si4x5z57siqn0kjggn6b7x0i9srdb9mf37";
    fetchSubmodules = true;
  };

})
