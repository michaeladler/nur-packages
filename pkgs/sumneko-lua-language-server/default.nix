final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-05-16";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "e62d964ff57cc0b37eb908315f9afe3ce6a213d7"; # tags/*
    sha256 = "1jkgr1jjfcb6sm8cvcs10y20dn2hjd9y96c3m30gbyl191d0z7lz";
    fetchSubmodules = true;
  };

})
