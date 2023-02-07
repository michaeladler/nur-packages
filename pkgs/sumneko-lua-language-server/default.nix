final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2023-02-07";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "42f48c7777abe9243372688701f8609ce923168c"; # tags/*
    sha256 = "096q6hn3zhhdwy3n5yi7j4wxmyrhssyxbbscq2cy1gslzl8icya2";
    fetchSubmodules = true;
  };

})
