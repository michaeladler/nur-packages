final: prev:

prev.lua-language-server.overrideAttrs (old: {
  version = "unstable-2023-05-23";

  src = prev.fetchFromGitHub {
    owner = "LuaLS";
    repo = "lua-language-server";
    rev = "4e2e282eaa79979c0bca2c4d1a2b3c1b2a64544e"; # tags/*
    sha256 = "0vpx7qxk33ydw1rf4alcrc1lyrhh22wpp0ajsxjicd3wf9wby30g";
    fetchSubmodules = true;
  };

})
