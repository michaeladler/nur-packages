final: prev:

prev.lua-language-server.overrideAttrs (old: {
  version = "unstable-2024-08-02";

  src = prev.fetchFromGitHub {
    owner = "LuaLS";
    repo = "lua-language-server";
    rev = "26a7b690c7eeb1a209b1b600886b2ac6691c5d2e"; # tags/*
    sha256 = "011wrh03j83d0gf23qrqrgmf2arhdr3k0vhni89b1s2c98szz5nk";
    fetchSubmodules = true;
  };

})
