final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-10";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "04c73dbedb8a82ed68ff0b0be32c2bee930fe529";
    sha256 = "15fxfkgcj2a0fhpl4i2rn3rz1f7ckk7va25haqhfndwz0amc87mv";
    fetchSubmodules = true;
  };

})
