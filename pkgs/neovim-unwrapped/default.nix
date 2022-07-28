final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-07-28";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "fe254fb7e7a8c143be581aa2f696770423595343";
    sha256 = "18rba0qgrxb3s4dqqxddv75ypzaqspqmb1fk8p1y37cv1xz2wlzz";
    fetchSubmodules = true;
  };

})
