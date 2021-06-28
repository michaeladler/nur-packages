final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "2021-06-27";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "3feba5ec0ba3add9ef1a1e9fbd09f1825f957b29";
    sha256 = "0z4qv70a0jxgy1pgqsfis297ksfgyih5bvq1qzqk7p8gv6n00wdz";
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
