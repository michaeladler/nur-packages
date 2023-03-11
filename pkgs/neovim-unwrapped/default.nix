final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-03-10";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "29a43ef8affbb9ecbae03b75db346205ffe9ec14";
    sha256 = "0lmvsknga1ynyqsxpvxan48d4mm001nja67ja3b1hmf3yv6h5xw6";
    fetchSubmodules = true;
  };

})
