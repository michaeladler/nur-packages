final: prev:

prev.lua-language-server.overrideAttrs (old: {
  version = "unstable-2024-04-22";

  src = prev.fetchFromGitHub {
    owner = "LuaLS";
    repo = "lua-language-server";
    rev = "5d9980edae90a71842f69ec13c13ac451f64e090"; # tags/*
    sha256 = "1rzcxnkqriwwfz762lpac92barl71cfk9315k70n6nkipk1l6zv2";
    fetchSubmodules = true;
  };

})
