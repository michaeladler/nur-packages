final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-03-09";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "e3cf2df47f2201b6b8a45e1412d882260580494d"; # tags/*
    sha256 = "1wxj3g86i8792pmcq4q5h36kg62jqlvpfhyagd8kzib3jjifvnwv";
    fetchSubmodules = true;
  };

})
