final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-04-25";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "14bf8a0d00cd6e485eff604c67dc21e29b80eef1"; # tags/*
    sha256 = "0x1la1005q3da4gzf5iywb69xc4r85w89v10pqjnfnjkbjnxw5xg";
    fetchSubmodules = true;
  };

})
