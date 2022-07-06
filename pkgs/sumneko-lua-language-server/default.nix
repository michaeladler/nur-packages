final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-07-06";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "f407cb07ed559daf7a5a943d8896e849791ae5b7"; # tags/*
    sha256 = "1qvkrjgjylqqhw3rz3l5yaff3kdw5wwcs8pcjii9k3i148l7x2w0";
    fetchSubmodules = true;
  };

})
