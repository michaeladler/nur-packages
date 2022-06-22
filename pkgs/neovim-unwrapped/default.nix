final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-06-22";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "b20b28249b1c58698be09c5b9d6785cfb1b12fb3";
    sha256 = "0rj5f20jybk4b31hgf8s2zac1l4xzlcrp9hf4kgyydf74s5qn3xj";
    fetchSubmodules = true;
  };

})
