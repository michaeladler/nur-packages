final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-21";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "649742821a640c47c3934e7366676efc03153a28";
    sha256 = "03n0dk2r8r4mppand1957g5zc8v3y89921wigxqsa8iv8qalv5dc";
    fetchSubmodules = true;
  };

})
