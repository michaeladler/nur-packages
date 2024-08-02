final: prev:

prev.lua-language-server.overrideAttrs (old: {
  version = "unstable-2024-08-01";

  src = prev.fetchFromGitHub {
    owner = "LuaLS";
    repo = "lua-language-server";
    rev = "bd0af02e9708fd901b3d17bad502b4ef8949e4fa"; # tags/*
    sha256 = "1nsd59v8n598f0slrdpdm5n49f3f4bm8dd106p2vyil6x550hda2";
    fetchSubmodules = true;
  };

})
