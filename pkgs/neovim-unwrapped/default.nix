final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-14";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "36acb803c673baa7969244d64bd5e319b7bbc675";
    sha256 = "03yr66ws1vymy7m755916m6xf2hsxx7s58z05q5g99rqb6gx9dwp";
    fetchSubmodules = true;
  };

})
