final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-13";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "89722ddfac51b0f7cbe5f4b0914e19ee9e8fdfd6";
    sha256 = "03vj7wjmvj76m6x3qq00vkw1744rm70y7cfb0lsx6s4icc7qag7c";
    fetchSubmodules = true;
  };

})
