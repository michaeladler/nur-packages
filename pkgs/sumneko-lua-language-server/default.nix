final: prev:

prev.sumneko-lua-language-server.overrideAttrs (old: {
  version = "unstable-2022-04-15";

  src = prev.fetchFromGitHub {
    owner = "sumneko";
    repo = "lua-language-server";
    rev = "c4f70450e6727a693586ad7941581ac51014545c"; # tags/*
    sha256 = "0g5iqgs6ibn9injsfckfc62rqhfdgz93mwf8xzjlx4gag9yky07w";
    fetchSubmodules = true;
  };

})
