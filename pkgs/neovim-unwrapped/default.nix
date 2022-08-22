final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-21";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "c086bf60794811ef33480e87000630e2d498b1bd";
    sha256 = "0himqgyg1b59cm1nkdx1396b5sz76jzn6x83xxwwj5hwpzls0h6b";
    fetchSubmodules = true;
  };

})
