final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-26";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "0b72e23bf13ade1e76d11eae6990014098b3928d";
    sha256 = "1kdmvbjq2x4r10yq1ai61wn1dkqwhdl7h2lb9nsjyih3bknsizgc";
    fetchSubmodules = true;
  };

})
