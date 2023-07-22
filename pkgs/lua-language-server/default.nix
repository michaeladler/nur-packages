final: prev:

prev.lua-language-server.overrideAttrs (old: {
  version = "unstable-2023-07-21";

  src = prev.fetchFromGitHub {
    owner = "LuaLS";
    repo = "lua-language-server";
    rev = "ecda29f02cc99304b254a7677c65aca8e8f457f3"; # tags/*
    sha256 = "0qkg308yndyhvhgzq1mihmkdck9f9zp24n6kc0hpbadh3ni58ciy";
    fetchSubmodules = true;
  };

})
