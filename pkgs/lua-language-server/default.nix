final: prev:

prev.lua-language-server.overrideAttrs (old: {
  version = "unstable-2023-03-23";

  src = prev.fetchFromGitHub {
    owner = "LuaLS";
    repo = "lua-language-server";
    rev = "50f77465af5ded634fd7aef07699cc4fc1c704f8"; # tags/*
    sha256 = "1q8qlrqqhs8csh5wl16h332aa7nyn73qqnn6bj5y44va43jcjyhj";
    fetchSubmodules = true;
  };

})
