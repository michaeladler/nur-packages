final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "unstable-2021-12-29";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "7cacfe9a6a93379ba823811b6b1679f00b40b988";
    sha256 = "0j4f6rxgkm1xga8d3bjjp5xs0n336gq9x4x0jm83jx03a1gcw0yx";
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
