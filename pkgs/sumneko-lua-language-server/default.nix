final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-11-14";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "09c4ae6d4960fc4ac93e202a8419c8b0a2d7a477"; # tags/*
    sha256 = "0wkrfm2yxqkjwjvwfyi65wnnq6y3w7h5dp2rfinwks2mzxsskm8k";
    fetchSubmodules = true;
  };

})
