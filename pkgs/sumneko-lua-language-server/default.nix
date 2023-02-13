final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2023-02-13";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "21420c986d807a55e22dd9b4261c3e3279a19eb0"; # tags/*
    sha256 = "0qwbhcjfsbvv2jj84q6szglsyyahw7iz5p8rxyfvck79bc59pk1l";
    fetchSubmodules = true;
  };

})
