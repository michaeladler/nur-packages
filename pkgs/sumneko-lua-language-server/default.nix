final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-09-06";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "efe82edce8af8160c3a6e0977bee935f7f8655d5"; # tags/*
    sha256 = "1yakjqcpkp7wly75s08xxyrj8lz3sccfqia2mf2cikhm198vsgsf";
    fetchSubmodules = true;
  };

})
