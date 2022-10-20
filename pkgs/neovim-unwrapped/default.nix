final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-20";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "ba887da97708545f1174e387b4807119ad5a40f6";
    sha256 = "1l6snwl5hq532rq6iy3lvldhkbbh56yfl3lbip49q4vf3fl8jbk0";
    fetchSubmodules = true;
  };

})
