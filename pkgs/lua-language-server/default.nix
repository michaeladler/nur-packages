final: prev:

prev.lua-language-server.overrideAttrs (old: {
  version = "unstable-2024-05-11";

  src = prev.fetchFromGitHub {
    owner = "LuaLS";
    repo = "lua-language-server";
    rev = "0df588358e9343ff50f1d68b12d971e50bbe7e7d"; # tags/*
    sha256 = "139jrcnqbp273zvfsdfp1ffc3vzdq1skjhai05ik8k9vb1ynk0s4";
    fetchSubmodules = true;
  };

})
