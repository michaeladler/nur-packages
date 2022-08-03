final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-03";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "c57e133e50b9f3ccd9a3d73f4e7e3e7281797000";
    sha256 = "05bfxhr0iiyp6mj894l19z21126lr0qd06bzyi6vl6ipn3iy37z8";
    fetchSubmodules = true;
  };

})
