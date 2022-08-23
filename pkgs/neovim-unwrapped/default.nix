final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-23";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "6cc6e11929ad76a2dc5204aed95cb9ed1dafde23";
    sha256 = "1mbq464y7bygkcqjf23jy1cfd7jidzycwcnmygj86cg2i4d61fhj";
    fetchSubmodules = true;
  };

})
