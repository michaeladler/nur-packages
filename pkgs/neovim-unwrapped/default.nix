final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-07-17";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "eb9b93b5e025386ec9431c9d35a4a073d6946d1d";
    sha256 = "00j4lsq28bn58d8fim9a1yhblij8dd1w0qvw8vx9mkbvwna84adc";
    fetchSubmodules = true;
  };

})
