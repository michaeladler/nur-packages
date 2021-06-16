final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "2021-06-16";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "fdb5e8f9fb5f7304e50c08a97275064d2053a9a2";
    sha256 = "066jk72rd063ik5cj7sarijwgz5pyj6v6cmsj8mhb1arsq94mbjd";
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
