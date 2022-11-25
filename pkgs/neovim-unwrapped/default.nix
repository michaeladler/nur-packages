final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-25";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "2738f842f6da712ec0648620d846bfacb14bdcef";
    sha256 = "0njy2qwzh10bv4l9j3sz9si6i9z655dghdc0bs7fvmzpcpnfi6qy";
    fetchSubmodules = true;
  };

})
