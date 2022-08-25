final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-25";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "674d3b2d5f5f7ade20cbd88ed64d63a80bb7b302";
    sha256 = "04rc880b3h1gr4bxfvlz7mw3qb1m2pmnw162a75nvlaaam7h2fj4";
    fetchSubmodules = true;
  };

})
