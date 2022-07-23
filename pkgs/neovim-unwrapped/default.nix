final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-07-22";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "ed6bbc03af7be192e3d615f8ee761611e78d9881";
    sha256 = "1f71a4iarhclb84n0b5gc0ykxv539agxy3i81q3r47i7cgvkgvjb";
    fetchSubmodules = true;
  };

})
