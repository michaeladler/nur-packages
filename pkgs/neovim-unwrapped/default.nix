final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-07-27";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "79872f377019614467a8e03049fb47c067331804";
    sha256 = "0ywz28q3dxxmqn9hy66s0li6f3i2xzvlznph5avzspbnpl6xpqvi";
    fetchSubmodules = true;
  };

})
