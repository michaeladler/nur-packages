final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-01-11";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "8c5c2136fef12e6fe00739c91ff994344ab5d466";
    sha256 = "0g5nnc595dd76lxnxrykkags9bmxwiv6hcr2cjbm7kfy9v96vxyx";
    fetchSubmodules = true;
  };

})
