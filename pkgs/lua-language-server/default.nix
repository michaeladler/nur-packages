final: prev:

prev.lua-language-server.overrideAttrs (old: {
  version = "unstable-2023-07-26";

  src = prev.fetchFromGitHub {
    owner = "LuaLS";
    repo = "lua-language-server";
    rev = "666a23e85707b73c22e02f620ad40607b18c4676"; # tags/*
    sha256 = "146y7cnkmymni432y9ki8d0375pxk6r4201ill7j4rgfx2l6qi3w";
    fetchSubmodules = true;
  };

})
