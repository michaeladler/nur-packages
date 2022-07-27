final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-07-26";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "0c4f94b7b4cc3f8776f8136e777634973bbc2ede"; # tags/*
    sha256 = "14a7xcph7f8nbvs74k6wxv4cha5qypl99n66w0zimnacpap29v6i";
    fetchSubmodules = true;
  };

})
