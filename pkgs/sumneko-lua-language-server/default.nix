final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-08-01";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "3b7b8b50acb2c0d6a2637269d34852e2bf43ac9a"; # tags/*
    sha256 = "1qhkhbpyywba4k8r4dm23yq0jfgxx1fsw8h12ff3391p7nwai2m1";
    fetchSubmodules = true;
  };

})
