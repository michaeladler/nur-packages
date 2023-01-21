final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2023-01-20";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "8da1d0d2158d73934b7c4af0a1e691fc1d58c639"; # tags/*
    sha256 = "1y2p2ig4g2yaq7wvrc55dlnh44cm3ck22sa1w1351yf9b8xz5gy7";
    fetchSubmodules = true;
  };

})
