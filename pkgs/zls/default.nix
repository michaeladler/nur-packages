final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "2021-06-16";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "a02c1e7996f407efbba08ab70b957425419772da";
    sha256 = "0535bn6qxcimkv13ydz5rvxrjsjj6kxhgl2fk355c4rxf2xnshm1";
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
