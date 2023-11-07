final: prev:

prev.lua-language-server.overrideAttrs (old: {
  version = "unstable-2023-11-07";

  src = prev.fetchFromGitHub {
    owner = "LuaLS";
    repo = "lua-language-server";
    rev = "5a763b0ceecc9a817c8ce534dc726f5f6f6e1ac9"; # tags/*
    sha256 = "005ivd80i8h1xrwpy8d7gf4kvqrgvmr1wlb3n3431n2bxnirfkx2";
    fetchSubmodules = true;
  };

})
