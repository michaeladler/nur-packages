final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-03-06";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "e389b189021cb6b72cfd7583ce6fb5d8d3346d45";
    sha256 = "0jln60dia98nlsrb47kx6j3lrx1gff3r2h2amvidhhxpf12yf56l";
    fetchSubmodules = true;
  };

})
