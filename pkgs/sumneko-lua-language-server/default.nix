final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2023-01-16";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "4cd472b94bb5766705c6062781a4d9c1908413e3"; # tags/*
    sha256 = "0lhgsds32c4njizdh20pgpay4lh5xd5wrkyccayarzh1s89m3x73";
    fetchSubmodules = true;
  };

})
