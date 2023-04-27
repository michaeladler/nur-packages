final: prev:

prev.lua-language-server.overrideAttrs (old: {
  version = "unstable-2023-04-26";

  src = prev.fetchFromGitHub {
    owner = "LuaLS";
    repo = "lua-language-server";
    rev = "19906a977c517b1e6edfd3ada60e20b2f9179e43"; # tags/*
    sha256 = "0003jpgf836jbb7xl5nqjfmwg0dqm3halsbfisv0ag1wdi5w58q0";
    fetchSubmodules = true;
  };

})
