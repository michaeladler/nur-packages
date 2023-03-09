final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-03-09";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "eaccd0decd707ff7cec318e06914f963daa9574c";
    sha256 = "03lvqqfazpq7ir8l4blcnrzc8rms8y38p7rnl90xa3dica6dqr00";
    fetchSubmodules = true;
  };

})
