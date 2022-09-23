final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-23";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "9aead1f670f42bac754709215fbab32397a202b0";
    sha256 = "1pfck4v31qybz9cgvbi4rblypcl6ammn5gfyr4343520sc18wyi9";
    fetchSubmodules = true;
  };

})
