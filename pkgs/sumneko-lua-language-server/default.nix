final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-04-11";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "e6e46580d171ebe4a3feb390652f1cf42faeac9a"; # tags/*
    sha256 = "0w8pybnf90xndqvqqisj2f2s58hb0jd9mrnpzcr3i9qghqfckygz";
    fetchSubmodules = true;
  };

})
