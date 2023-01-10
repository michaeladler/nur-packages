final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-01-10";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "1df2db0bc4dfa2e4f632f9b3dbae00b8b29f2d9f";
    sha256 = "15c86c3fqap0vnbifln2dj7k7wgc4j0kh5xfxmdqqss97hd0hyxk";
    fetchSubmodules = true;
  };

})
