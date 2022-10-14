final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-14";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "cb7da02701d542d3c1618f44f6217944986f09f9";
    sha256 = "0x5bpkm834mipid1assrw5gqzjskyzvi2blkj9194q3jmzkg518b";
    fetchSubmodules = true;
  };

})
