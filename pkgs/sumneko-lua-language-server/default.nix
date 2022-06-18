final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-06-17";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "6fbe324f7130c94046ce14eee2235b663b47eafc"; # tags/*
    sha256 = "1brbzdfw8c3vm567s1mbly0dsarqqr2qyzmgjcfhxp1xblisv999";
    fetchSubmodules = true;
  };

})
