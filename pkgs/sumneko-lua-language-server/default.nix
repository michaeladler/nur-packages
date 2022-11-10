final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-11-10";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "9e61b29f8039fc7c41c792ad69c1df5d21e864fd"; # tags/*
    sha256 = "1mddm2agzkv6cq41i7y72fr94nqq1jg8k26riwrfcj48n951jsi6";
    fetchSubmodules = true;
  };

})
