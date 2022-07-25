final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-07-25";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "e9b58a619e1dd7a831138dc14bd8258104724e06";
    sha256 = "0gk9ivx2w0ac1igyav0k13jcryhiv5rw8z403fgqidag9rxq8pp5";
    fetchSubmodules = true;
  };

})
