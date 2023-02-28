final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-28";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "f113cba3ec127201f54094f9174b50ee3001fbee";
    sha256 = "0a14l4imhzz8wr10nw5drrfpws834xprqg8hmj4mnqyhgysqirah";
    fetchSubmodules = true;
  };

})
