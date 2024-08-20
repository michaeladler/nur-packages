final: prev:

prev.lua-language-server.overrideAttrs (old: {
  version = "unstable-2024-08-19";

  src = prev.fetchFromGitHub {
    owner = "LuaLS";
    repo = "lua-language-server";
    rev = "ba8f90eb0fab18ce8aee2bdbf7007dc63050381d"; # tags/*
    sha256 = "1kpnjzhqqizivayhlbxqc77ckq21nwhav2pf2d75g9kb1jwn0lwl";
    fetchSubmodules = true;
  };

})
