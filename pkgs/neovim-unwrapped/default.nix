final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-22";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "2f9b94a26836ecb081c717e23913f5b6576cce99";
    sha256 = "1zb4riy4683ccgx5havzw60pz2qrpg8kfadpr7aivqy3ql4qqh45";
    fetchSubmodules = true;
  };

})
