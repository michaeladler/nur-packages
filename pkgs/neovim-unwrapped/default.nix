final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-27";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "f44ad753801d881f5352c9182167ced18e79e456";
    sha256 = "1lqxrrism2p18swaq2ci3bb3irb69r3akh97z9xk7a2ripv3rkbg";
    fetchSubmodules = true;
  };

})
