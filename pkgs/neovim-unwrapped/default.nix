final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-01-02";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "3a519d86bf4d5ef3ff5623ad925ed856266d80de";
    sha256 = "0zkgmdrnx59fp116k1scljbk9nk8hbhzq6py9wlk2vv0vr5xzvcd";
    fetchSubmodules = true;
  };

})
