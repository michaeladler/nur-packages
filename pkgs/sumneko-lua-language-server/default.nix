final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-06-09";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "afb4f838f65d22443ccf30089b2f898fc9c55430"; # tags/*
    sha256 = "0fbl7aw0s2wk3c6apdbyvqwkkc1yfd8lq02g2gml0166vndm6cw1";
    fetchSubmodules = true;
  };

})
