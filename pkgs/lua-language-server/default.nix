final: prev:

prev.lua-language-server.overrideAttrs (old: {
  version = "unstable-2024-01-05";

  src = prev.fetchFromGitHub {
    owner = "LuaLS";
    repo = "lua-language-server";
    rev = "34ff9d3ca730bc28879ab2b0c1a49f2c5480f9a3"; # tags/*
    sha256 = "0md4b2sd9fc907vycjplkim92b3hrsc5jydc8rghr9inlg68x4y0";
    fetchSubmodules = true;
  };

})
