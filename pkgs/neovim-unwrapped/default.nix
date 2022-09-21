final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-21";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "37a71d1f28e5d7fd13f0ede69b4d2558157a9e4b";
    sha256 = "0728845rj7zji8351ia60ms0vkjpxgr18ggs5i2c4laqhd9k7rj9";
    fetchSubmodules = true;
  };

})
