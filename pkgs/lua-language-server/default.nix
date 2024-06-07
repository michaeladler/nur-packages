final: prev:

prev.lua-language-server.overrideAttrs (old: {
  version = "unstable-2024-06-06";

  src = prev.fetchFromGitHub {
    owner = "LuaLS";
    repo = "lua-language-server";
    rev = "f437ac3594cf56cbd6ce5160a03e716f5192e85e"; # tags/*
    sha256 = "1d3lbidc9rvhamcw20n89kd2ray24sw8a9zlj9vj1bvap0p9i78d";
    fetchSubmodules = true;
  };

})
