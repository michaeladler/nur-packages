final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-09";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "48e060f648f4da94f4e1394068186e2709e4a5f4";
    sha256 = "1h27f98rn9vwcfx67qww258acicp8x44q7xz6cnp8yzs42habchp";
    fetchSubmodules = true;
  };

})
