final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-06-29";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "b09404bb037f50e5fdba9eecfe0e55c9e12faa6f"; # tags/*
    sha256 = "11krk5npizn44lk81xsv0fg4gch72acy0444488b4pfgyg45dws0";
    fetchSubmodules = true;
  };

})
