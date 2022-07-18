final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-07-17";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "1b462705d049fa0cf2bb99bae9112b84abea8d5a";
    sha256 = "1x9i3qpkp66bj8xbf8p1jxxk3srbmcskaxl9yl7rkv749831xba4";
    fetchSubmodules = true;
  };

})
