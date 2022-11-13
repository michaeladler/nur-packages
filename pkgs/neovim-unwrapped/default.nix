final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-13";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "9d7dc5062877bd7e035f1f7a74e2462c2e942864";
    sha256 = "1rs9dd4ymcimvsg3015dk2fnrrfn3y7i0g3q0bkpfkjb6h32nda4";
    fetchSubmodules = true;
  };

})
