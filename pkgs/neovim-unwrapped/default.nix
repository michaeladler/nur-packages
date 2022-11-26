final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-26";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "84465a8c1583f444d4365b2a70e03cd38ebe7f81";
    sha256 = "1p2kmpxm6ihs9kl15njkcyn4n0rnjvawdsazdcy6r6ljdc5mr2y4";
    fetchSubmodules = true;
  };

})
