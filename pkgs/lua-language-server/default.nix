final: prev:

prev.lua-language-server.overrideAttrs (old: {
  version = "unstable-2024-08-16";

  src = prev.fetchFromGitHub {
    owner = "LuaLS";
    repo = "lua-language-server";
    rev = "d702a55715df19a219e963da496e6fb76db0aacd"; # tags/*
    sha256 = "0cpn69a4d00fa2a96b91ickdfwxsinp18gy5hn7d1k4bvgr5r20n";
    fetchSubmodules = true;
  };

})
