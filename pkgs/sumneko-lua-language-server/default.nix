final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2021-12-02";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "cb2042160865589b5534a6bf0b6c366ae4ab1d99"; # tags/*
    sha256 = "13if73x4bg21ihbas80i3211plwwmipkmxc2yphq95rxr5cprjid";
    fetchSubmodules = true;
  };

})
