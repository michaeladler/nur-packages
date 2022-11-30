final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-30";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "c0d17cec0b691488dbb3a57433e39d97aff36c47";
    sha256 = "0gg5kjh4iksgny5zjlzq40zgsnx6n5208kav23x1767c70r55y8v";
    fetchSubmodules = true;
  };

})
