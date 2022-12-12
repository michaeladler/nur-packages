final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-11";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "407eef473871b218e036a0c7ee993af3d4452777";
    sha256 = "0n3bl3cb7y099nlb92ksfzzbwr2js93nlbwi6c7hizjgp76cpjvr";
    fetchSubmodules = true;
  };

})
