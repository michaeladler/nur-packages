final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-16";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "72a19b2ffe93ab20f6ff1825e11b43da4e44842a";
    sha256 = "115lc3xag5d28np14hbz9ja3h869kck652bh3rlp1dsxrx61z6gf";
    fetchSubmodules = true;
  };

})
