final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-20";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "de90a8bfe5ff4b440597e6d3301bdc3bde01990a";
    sha256 = "191ylyrx1hiamb9vsah801i474hvr98xk89s9cbx57plj6xx9j4h";
    fetchSubmodules = true;
  };

})
