final: prev:

prev.lua-language-server.overrideAttrs (old: {
  version = "unstable-2024-04-23";

  src = prev.fetchFromGitHub {
    owner = "LuaLS";
    repo = "lua-language-server";
    rev = "6b5e19597d88a219aac73cbccd6f88a4213e07aa"; # tags/*
    sha256 = "1y4xndl6kqvnh6xccnpayb3yhn7fcrgm79y2dlb27fq0dcm7npk6";
    fetchSubmodules = true;
  };

})
