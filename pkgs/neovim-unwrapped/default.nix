final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-01-01";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "c590641febf4d03e89c46f8e7ef4c3fb2a455520";
    sha256 = "1vv3wgd17gsh5156j6l7l3pwgrl6xdik1rliik4r0vy72nz5g0yq";
    fetchSubmodules = true;
  };

})
