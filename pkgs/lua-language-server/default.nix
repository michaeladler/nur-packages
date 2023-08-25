final: prev:

prev.lua-language-server.overrideAttrs (old: {
  version = "unstable-2023-08-24";

  src = prev.fetchFromGitHub {
    owner = "LuaLS";
    repo = "lua-language-server";
    rev = "d912dfc05636ca113eb074d637905f4b2514229d"; # tags/*
    sha256 = "1j3qvif2hfhiq39cggb16561q85fb6xhnljb0bcxw909vhq64jwi";
    fetchSubmodules = true;
  };

})
