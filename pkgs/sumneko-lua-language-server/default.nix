final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-04-17";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "076dd3e5c4e03f9cef0c5757dfa09a010c0ec6bf"; # tags/*
    sha256 = "13m6d4cx8bmdagz1sfi9nsjsrfrmalyqvpg2lshliiphwpp1lj1z";
    fetchSubmodules = true;
  };

})
