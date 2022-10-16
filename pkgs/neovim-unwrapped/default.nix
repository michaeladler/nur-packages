final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-16";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "0b71960ab1bcbcc42f2d6abba4c72cd6ac3c840b";
    sha256 = "1gmjif1jahhmqxmq49njk8yd0v5pf5cjnfdjiscmp6zaiq74ci31";
    fetchSubmodules = true;
  };

})
