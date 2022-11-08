final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-11-08";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "110c4105a374858aeae71749c26b81cfab1ccd0a"; # tags/*
    sha256 = "1j79aaxnalznc39ipnvqh9g0jrrvv2wj50dkf2x5zf8wwwizvii6";
    fetchSubmodules = true;
  };

})
