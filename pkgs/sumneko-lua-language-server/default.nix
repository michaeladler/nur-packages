final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-04-09";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "4d0e01ce2699e0fecd14563c42ad56131b89cf56"; # tags/2*
    sha256 = "1dbfpjkpa03bq8yxixml7wcd9drw3g5jfrxr33qycn905w299qvh";
    fetchSubmodules = true;
  };

})
