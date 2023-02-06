final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-06";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "6c39edaa7e5060cedfbbf61e88f4aad20fdff73d";
    sha256 = "1cfskdxb2qmv54bb21pa6hpycyfi8fdpgx5wlh28rzcr1znjwm9c";
    fetchSubmodules = true;
  };

})
