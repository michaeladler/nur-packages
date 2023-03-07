final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-03-07";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "bf4eada2c83f5402fc56370fd22af11029a4a3aa";
    sha256 = "1sq24vdgfy7zkfqg3gny20wqm6bcnzif75072gbqlcm0gng6m5lw";
    fetchSubmodules = true;
  };

})
