final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "unstable-2021-09-30";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "779cfac82e7caac8504e0e1ebc7250f8c0a60adc";
    sha256 = "1pc6yn15p7qvn5kk257rcacwm97mpzg5fd650455yqv3ljyc9qp0";
    fetchSubmodules = true;
  };

  dontConfigure = true;
  dontInstall = true;

  buildPhase = ''
    mkdir -p $out
    zig build install -Drelease-safe=true -Ddata_version=master -Dcpu=baseline --prefix $out
  '';

  XDG_CACHE_HOME = ".cache";
})
