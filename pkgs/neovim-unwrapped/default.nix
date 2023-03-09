final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-03-09";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "3ad845882413944a8d6ed3bd9da68c6b4cee0afb";
    sha256 = "0pfxw1pdp7h9xjyfpmw0bsmdc11w3ccnmd357bv4mhibhrrpb5yf";
    fetchSubmodules = true;
  };

})
