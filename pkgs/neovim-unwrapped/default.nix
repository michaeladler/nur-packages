final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-13";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "1e5daed67693f88d3ad515cf9e2d2f6d29c48a08";
    sha256 = "19rjifmryprk8zc44qcx09m45vf8irha7ry4m81pkq58v0czhb99";
    fetchSubmodules = true;
  };

})
