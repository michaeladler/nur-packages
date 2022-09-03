final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-02";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "1ffd527c837fb2465c9659273bbe5447a1352db2";
    sha256 = "0b1br7djjj8vbp5r9rf14zgzviqgix10ziv955jkfj49y4wiq9zf";
    fetchSubmodules = true;
  };

})
