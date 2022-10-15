final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-15";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "1c478391ca7754bf5ecb4b76c29acfa9b4978393";
    sha256 = "1rrh0325r6biq0z3qwwhyrrjffxvikicrggf3m3a26igyy4cb2cg";
    fetchSubmodules = true;
  };

})
