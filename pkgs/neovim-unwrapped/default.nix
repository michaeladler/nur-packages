final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-18";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "ba04fffe9869159efe6660d782f436fa8348aae2";
    sha256 = "0j1pg7h5pb21mvg2807f2cv9b90ni28xx1nvw9fpm0mfbri7ly9l";
    fetchSubmodules = true;
  };

})
