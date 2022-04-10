final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-04-10";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "23ef4b17535ba14e62427a6084e3060223133687"; # tags/*
    sha256 = "01iqd31y2as483wfawlr57ll0lbbhkgpyjnq4v8ipv66hwkw0043";
    fetchSubmodules = true;
  };

})
