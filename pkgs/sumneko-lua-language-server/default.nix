final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-02-21";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "d57c21e585e7285583b7379e9e955da3b1345508"; # tags/*
    sha256 = "01qh7s70l6lbx00vygjpwf7x04wm2k23ax7i7gqa2n7y1n373ihx";
    fetchSubmodules = true;
  };

})
