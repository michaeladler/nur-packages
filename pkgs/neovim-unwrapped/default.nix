final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-17";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "0326ef2f41a5c18c6cfd2c1b1dda95f7b309a5c4";
    sha256 = "1d2p4ahgfxsz5gqdj74b35mqq4qbijfkck04fy48lfx9cga3d6kq";
    fetchSubmodules = true;
  };

})
