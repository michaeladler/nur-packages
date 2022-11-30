final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-29";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "d311c5481dede47d752fa39cb00d728ba18ef5bc";
    sha256 = "13jhd49pqjvq2mpi0p830bcnhwf7s91h35p75py1gy5ir91k9kx7";
    fetchSubmodules = true;
  };

})
