final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2023-01-17";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "75d4e9ec1a3df6c2a8d1a19eb57a26eb776f3624"; # tags/*
    sha256 = "0wpp4x1v6h08cy40adj5b8nsz9fb5klghfhgcpfwx695rfx85kv1";
    fetchSubmodules = true;
  };

})
