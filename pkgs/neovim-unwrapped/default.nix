final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-06-26";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "e8ee6733926db83ef216497a1d660a173184ff39"; # tags/v*
    sha256 = "1jn4i4ral79ys06i50bimylm515sfh41z503gj50a74h1ylg0z4w";
    fetchSubmodules = true;
  };

})
