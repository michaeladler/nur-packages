final: prev:

prev.lua-language-server.overrideAttrs (old: {
  version = "unstable-2023-11-09";

  src = prev.fetchFromGitHub {
    owner = "LuaLS";
    repo = "lua-language-server";
    rev = "ee590a4cd1bc972ffe19e232b176aa1ffaba2d47"; # tags/*
    sha256 = "1slhdlk832x8ffyaxi0918hnb3ai5va8q7dr2i5fy1qsfiplfbj2";
    fetchSubmodules = true;
  };

})
