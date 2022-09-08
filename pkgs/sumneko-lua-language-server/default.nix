final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-09-07";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "3daee7053529c03834063ad4f5c7e0da971d5dbf"; # tags/*
    sha256 = "136w8ijka2w89z3vr8pm837cwdj83d6z61yb83id83q18kbma82d";
    fetchSubmodules = true;
  };

})
