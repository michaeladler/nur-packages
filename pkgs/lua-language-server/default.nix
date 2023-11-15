final: prev:

prev.lua-language-server.overrideAttrs (old: {
  version = "unstable-2023-11-14";

  src = prev.fetchFromGitHub {
    owner = "LuaLS";
    repo = "lua-language-server";
    rev = "50dfc81e075be5fe2cdf7b2b94007dd5ed2edefa"; # tags/*
    sha256 = "1mvysi2abrbc8ly7ffbzmx718b8ry5l85mpk4wdsbkgzdqc52348";
    fetchSubmodules = true;
  };

})
