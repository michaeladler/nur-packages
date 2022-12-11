final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-11";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "3dadd3aca5af4d09d0acbb027098b1a2c889e433";
    sha256 = "0445mwysjd99m50qaa8z1afljdn27y2x84xfhw1g812bpj556mv1";
    fetchSubmodules = true;
  };

})
