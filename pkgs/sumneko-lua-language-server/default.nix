final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2021-11-29";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "fb9dc04fc284843c021c4dc912a0a1b01cb0b6a9"; # tags/*
    sha256 = "0dw068lv1npb9zmw4scfq1bvr6hgd6mdzl5pfxdc85yv8p9869fy";
    fetchSubmodules = true;
  };

})
