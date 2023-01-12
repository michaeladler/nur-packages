final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-01-12";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "2f1fd15554921dc2375c2ad136e727229e72348a";
    sha256 = "01r1qhzwxygbxd62s3rhyfnd1xka8zbahg05gx2p5aq72w3bx6hn";
    fetchSubmodules = true;
  };

})
