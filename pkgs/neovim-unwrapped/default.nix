final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-03-09";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "0ecb4d725e9e2086b045670e4c2fa8962b63d99c";
    sha256 = "19pnilxbykl6gwknl067r369nvg0x6yia6i9m78ifkrqi2rxf0vc";
    fetchSubmodules = true;
  };

})
