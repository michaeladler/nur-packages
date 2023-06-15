final: prev:

prev.lua-language-server.overrideAttrs (old: {
  version = "unstable-2023-06-14";

  src = prev.fetchFromGitHub {
    owner = "LuaLS";
    repo = "lua-language-server";
    rev = "d95fe20a07d599994323a766c6f78e4867ddcace"; # tags/*
    sha256 = "0np3y7gbhxpaw60gz3s5zln6jkg25szrxgdi6kxg5d8rd9nmn3nh";
    fetchSubmodules = true;
  };

})
