final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-07";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "1391385ba9f83d32f3b6fc54587f03a1d34960d9";
    sha256 = "13kvsjvkqznjfixs3aganvrvjgykvqqvkwrpdb0q6v7mshwmayi2";
    fetchSubmodules = true;
  };

})
