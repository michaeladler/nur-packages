final: prev:

prev.lua-language-server.overrideAttrs (old: {
  version = "unstable-2024-05-14";

  src = prev.fetchFromGitHub {
    owner = "LuaLS";
    repo = "lua-language-server";
    rev = "e89d53912c6189448e721f5e3a012759538d0da6"; # tags/*
    sha256 = "15l2gvbr6i4789frzz44h0ch4h341dp7bks4wfdnyyslrsp971rk";
    fetchSubmodules = true;
  };

})
