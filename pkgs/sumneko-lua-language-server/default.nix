final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-09-16";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "16f4d9c3269f54c102381d9fa44b5773c5b8c2c2"; # tags/*
    sha256 = "17f0lvn7g54rmb3cm4672cxxyby37kr8iardj6s83zdal0vzykjb";
    fetchSubmodules = true;
  };

})
