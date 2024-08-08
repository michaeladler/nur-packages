final: prev:

prev.lua-language-server.overrideAttrs (old: {
  version = "unstable-2024-08-08";

  src = prev.fetchFromGitHub {
    owner = "LuaLS";
    repo = "lua-language-server";
    rev = "aaf16240f77bb75a3d8db89c2a99934c8b6022ee"; # tags/*
    sha256 = "1wqx63vhbbn6k9vyhnmknhb6iigvl0bbn6gv6ckdmkv3h77mb7ky";
    fetchSubmodules = true;
  };

})
