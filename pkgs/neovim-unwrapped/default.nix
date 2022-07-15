final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-07-15";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "072fb55cb04c03e0ec2d7378ee845d8fd96b2697";
    sha256 = "0iq0dfji6zvmz22bim0sis4lsl0cpgbvsjvzzprjs2w1m5zp3lhi";
    fetchSubmodules = true;
  };

})
