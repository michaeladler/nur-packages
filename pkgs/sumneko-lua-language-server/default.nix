final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-11-08";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "442da6b179af08d5c15ae1a66ea9ff37e627fc64"; # tags/*
    sha256 = "0j9si5a3pw0fnc9v6n570rnw1wk54zlirksi72xpmf2dgr77cp4f";
    fetchSubmodules = true;
  };

})
