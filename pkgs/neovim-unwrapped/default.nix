final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-01-06";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "f7ad46e69ed407579517694ccf3dc1beffe7acdc";
    sha256 = "1iqax48gxwld45d3q2fxq6hdday9mqywnfx07gzf2fakaxzl13k9";
    fetchSubmodules = true;
  };

})
