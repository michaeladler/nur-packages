final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-07-05";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "579909cc99018e69a865d9b682ad6e867ab002dc"; # tags/*
    sha256 = "11i71rqxmn07vql1s56w437dwfg6av38s3wa69g4hgjxx1qbg5h3";
    fetchSubmodules = true;
  };

})
