final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-06-29";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "6f6286e4f90da25a7d1b6bcc96b79b0ccbaf5c26";
    sha256 = "1szjq4vv8cbsfdsby4rds5ld8iaw1cg1p03v1vn1c3q549k4zrsr";
    fetchSubmodules = true;
  };

})
