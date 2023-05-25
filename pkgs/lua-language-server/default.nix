final: prev:

prev.lua-language-server.overrideAttrs (old: {
  version = "unstable-2023-05-24";

  src = prev.fetchFromGitHub {
    owner = "LuaLS";
    repo = "lua-language-server";
    rev = "90cc228b936dfdcdf4a4dcf9cfd85d295bb71493"; # tags/*
    sha256 = "0dizzgk0jvsv039ilm0lfjwy9kib0kl9a5x5b4s7a9csiqvfbgbm";
    fetchSubmodules = true;
  };

})
