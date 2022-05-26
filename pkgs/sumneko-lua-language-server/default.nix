final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-05-25";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "505ed9411939fe8c45903e3c9ce559fde50a0584"; # tags/*
    sha256 = "1pyn66bgcw4c1rg9rdmmpi3qighmd0b9hlxai3smfy2a1fxg1s0w";
    fetchSubmodules = true;
  };

})
