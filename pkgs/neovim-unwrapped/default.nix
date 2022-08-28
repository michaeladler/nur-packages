final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-28";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "88c32b5eba9fa7072bb4a76a8dbb73c6603165be";
    sha256 = "0dbxm1c48z3ifjm94x0ldn59fryqvagmkrjsh65bns2sjf32rmml";
    fetchSubmodules = true;
  };

})
