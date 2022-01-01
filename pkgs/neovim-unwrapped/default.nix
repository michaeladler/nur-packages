final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2021-12-31";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "5b839ced692230fe582fde41f79f875ee90451e8"; # tags/*
    sha256 = "10p6lg5yv9n6wcwdprwvvi56dfcm4wsj54nm0invyx3mhf7374lx";
    fetchSubmodules = true;
  };

})
