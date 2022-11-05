final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-05";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "95f2f3cb5efcc18f17f2812ba6d1d9e1c06b2b5a";
    sha256 = "1zcm5adj6x8bmj00qaxm3bfj4z84khvbknmlzv4ywvqnhlrmybgq";
    fetchSubmodules = true;
  };

})
