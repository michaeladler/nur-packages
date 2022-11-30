final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-11-29";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "8132f4c9da02858c23813d15c2cb6ded6df57ea1"; # tags/*
    sha256 = "14qvhhyh1lhw9ihn0p4a63q1kac2lsp85vfr7lkvdccnaj5ng8g3";
    fetchSubmodules = true;
  };

})
