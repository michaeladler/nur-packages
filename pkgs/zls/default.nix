final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "unstable-2021-11-03";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "d4b6b97c019972de6e4fd710045d2b9349147ad3";
    sha256 = "02r70fvhmnkwbyyqrbrci8dfqhw8ayvjz3prvr3zxsn6q6s37p9m";
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
