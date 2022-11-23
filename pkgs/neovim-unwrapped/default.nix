final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-23";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "f1b88ced07a5dcc62cd847cade2ed97e23fffbf9";
    sha256 = "19cjnwvfawli6vh1h6458im0ryw1r3qhfzdd7gnsq65fx6hkb7q4";
    fetchSubmodules = true;
  };

})
