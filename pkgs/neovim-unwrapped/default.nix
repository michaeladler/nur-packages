final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-01";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "1390e97c200ee265f72a4e2d7ec1a47fd65462ee";
    sha256 = "1lkn50sszrwlbcq29bkby02wlsyg6mqqnhqj5ld5d6cxzm0p2gp7";
    fetchSubmodules = true;
  };

})
