final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-20";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "1a57cd383684b7488e02e094f49dfe607bc53632";
    sha256 = "15fv0mqyrqkbnrd8giwq81khi1f1w19s4dd2mcn430sa1rc5jr45";
    fetchSubmodules = true;
  };

})
