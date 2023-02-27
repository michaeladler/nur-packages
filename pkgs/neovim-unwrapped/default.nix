final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-27";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "2c9fbe34b20266ef5ab54f6ed14fb38eef60430d";
    sha256 = "0nqvjm2dd8smib5mjssrfiwvjk5ayszsjx8v7y5224x9g85ghfr7";
    fetchSubmodules = true;
  };

})
