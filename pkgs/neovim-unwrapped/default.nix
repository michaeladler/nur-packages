final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-19";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "6e8ed5abaa9c33d1d78ab7ff5b07dd5bac623a1d";
    sha256 = "1zvawpv9pdpihm0474q8x8vhdjd2ma67p1wdzcznrd71b11ba5w0";
    fetchSubmodules = true;
  };

})
