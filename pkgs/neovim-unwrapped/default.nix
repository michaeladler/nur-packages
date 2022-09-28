final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-28";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "39652100558726ab5fec86153e09816b7e7bf7f5";
    sha256 = "1hpz8ki4zv5sd7pvfjnar1lxjcs519i2v7abdsbqg499pcp3khk3";
    fetchSubmodules = true;
  };

})
