final: prev:

prev.lua-language-server.overrideAttrs (old: {
  version = "unstable-2024-06-11";

  src = prev.fetchFromGitHub {
    owner = "LuaLS";
    repo = "lua-language-server";
    rev = "2dfb12ad3759acb7ff47b4c5c54ad0a62c598b22"; # tags/*
    sha256 = "0blp3blpdks5ffkzx8qqjddlm696nxq6a3ins4v5w2kxj6452wx3";
    fetchSubmodules = true;
  };

})
