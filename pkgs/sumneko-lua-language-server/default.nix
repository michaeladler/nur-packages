final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2023-03-09";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "79b2a72e143fdb9119e5db3387cd3deca27e330c"; # tags/*
    sha256 = "01f5rkh8kdvw4dhv11snsgzpk027hjhg6f1p8h7s3vbb9y4g42zw";
    fetchSubmodules = true;
  };

})
