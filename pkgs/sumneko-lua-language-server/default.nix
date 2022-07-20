final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-07-19";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "be85f2c855f9075cadae3219f4dc1f3ce1f920ca"; # tags/*
    sha256 = "0ppb975bl4bd2ihjc79ih6v49m8z7lckrfxp48c3wz33vdvb4q78";
    fetchSubmodules = true;
  };

})
