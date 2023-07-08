final: prev:

prev.lua-language-server.overrideAttrs (old: {
  version = "unstable-2023-07-07";

  src = prev.fetchFromGitHub {
    owner = "LuaLS";
    repo = "lua-language-server";
    rev = "dc15ea90474e63c5203e9504f44aeea0b08db99e"; # tags/*
    sha256 = "1fsxwxrjcm8k3k1hsai9qzq6na0s7ipiz2jf1h6114kxpwypib5m";
    fetchSubmodules = true;
  };

})
