final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-08-13";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "dacf711d57cddbf106937abd64f544a9298f3349"; # tags/*
    sha256 = "0gd11x03nbivfl28g0l4jp7bfzxlc3576kp5bdrslcr0f567xw1b";
    fetchSubmodules = true;
  };

})
