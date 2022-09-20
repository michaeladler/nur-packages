final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-19";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "875b58e0941ef62a75992ce0e6496bb7879e0bbe";
    sha256 = "1sc8vp01gvqf7wxrf63y89sf37yq3gaf71n1l0nr72id0pz9jakf";
    fetchSubmodules = true;
  };

})
