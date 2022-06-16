final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-06-15";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "fde5288aa33c1deadc0724cb2e9df2b628a310c6"; # tags/*
    sha256 = "0xiapz6xfib18dxcbydmn281219f8r1iq2r1amrgzv36qs08n15q";
    fetchSubmodules = true;
  };

})
