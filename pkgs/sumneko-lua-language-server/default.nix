final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2023-03-02";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "8da10a0819f11dfcfb9b4e00fecedb475b696e6d"; # tags/*
    sha256 = "0pdskvrr6cdn1ylw8l2mrnh2v18mhw39s87p9p7mgs7372cm6cgm";
    fetchSubmodules = true;
  };

})
