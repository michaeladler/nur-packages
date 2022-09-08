final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-08";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "078e49b96a4f3e4255371cd40c18295bab2149d0";
    sha256 = "0dwqyj2vql5khiig20bcmnf4gyb9dl2ss4xskczrsjvjqr82f11i";
    fetchSubmodules = true;
  };

})
