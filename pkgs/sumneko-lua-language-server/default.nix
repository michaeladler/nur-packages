final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2021-12-06";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "dc5ee0b01a9610389e275ed8ff0746ba78cdd367"; # tags/*
    sha256 = "0jlhw22w15rrp1khbp5rqsyqs0h3ak8ygjv4zkvfw2403xcskrwj";
    fetchSubmodules = true;
  };

})
